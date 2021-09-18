const initRecordVideo = () => {
  const start = document.getElementById("start");
  const stop = document.getElementById("stop");
  const live = document.getElementById("live");

  const stopVideo = () => {
    live.srcObject.getTracks().forEach(track => track.stop());
  }

  const stopRecording = () => {
    return new Promise(resolve => stop.addEventListener("click",   resolve));
  }

  const startRecording = (stream) => {
    const recorder = new MediaRecorder(stream);
    let data = [];
    recorder.ondataavailable = event => data.push(event.data);
    recorder.start();
    const stopped = new Promise((resolve, reject) => {
      recorder.onstop = resolve;
      recorder.onerror = event => reject(event.name);
    });
    const recorded = stopRecording().then(
      () => {
        stopVideo();
        recorder.state === "recording" && recorder.stop();
      }
    );
    return Promise.all([
      stopped,
      recorded
    ])
      .then(() => data);
  }

  const uploadToDatabase  = (recordedBlob) => {
    const formData = new FormData(document.getElementById("record-video-container"));
    formData.append('video[file]', recordedBlob, 'my_video.mp4');
    $.ajax({
      url: "/videos",
      type: "post",
      processData: false,
      contentType: false,
      data: formData
    })
    alert('Video is uploading, Hold for a sec!')
  }

  start.addEventListener("click", () => {
    navigator.mediaDevices.getUserMedia({
      video: true,
      audio: true
    })
      .then(stream => {
        live.srcObject = stream;
        live.captureStream = live.captureStream || live.mozCaptureStream;
        return new Promise(resolve => live.onplaying = resolve);
      })
      .then(() => startRecording(live.captureStream()))
      .then (recordedChunks => {
        const recordedBlob = new Blob(recordedChunks, { type: "video/webm" });
        uploadToDatabase(recordedBlob)
      })
  });
}
export { initRecordVideo };