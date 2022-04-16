
console.log("in signature.js")
function resizeCanvas(canvas) {
  var ratio = Math.max(window.devicePixelRatio || 1, 1);
  canvas.width = canvas.offsetWidth * ratio;
  canvas.height = canvas.offsetHeight * ratio;
  canvas.getContext("2d").scale(ratio, ratio);
}

$(document).on('turbolinks:load', function () {
  var canvas = document.querySelector("canvas");

  if (canvas) {
    canvas.height = canvas.offsetHeight;
    canvas.width = canvas.offsetWidth;
    // window.onresize = resizeCanvas(canvas);
    // resizeCanvas(canvas);
    const signature_pad = new SignaturePad(canvas, { backgroundColor: '#F7F5F2' });
    console.log(signature_pad.toDataURL())
    $('.signature_pad_clear').click(function () { signature_pad.clear() });
    $('.signature_pad_save').hover(function (event) {
      if (signature_pad.isEmpty()) {
        alert('You must sign before to save');
        event.preventDefault();
      } else {
        $('.signature_pad_input').val(signature_pad.toDataURL());
      }
    });
  }
});
