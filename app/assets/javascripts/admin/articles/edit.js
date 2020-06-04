$(function(){
    show_main_image();
});

function show_main_image(){
  var selfInput = $('.main-image-box').find('input[type=file]'),
  prevElm = $('.main-image-box').find('.main-image'),
  orgPass = prevElm.attr('src');

  selfInput.on("change",function(){
      var file = $(this).prop('files')[0],
      fileRdr = new FileReader();

      if (!this.files.length || !file.type.match('image.*')){
        prevElm.attr('src', orgPass);
        return;
      } else {
        fileRdr.onloadend = function() {
            prevElm.attr('src', fileRdr.result);
        }
        fileRdr.readAsDataURL(file);
      }
  });
}
