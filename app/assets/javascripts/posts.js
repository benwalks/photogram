// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// function readURL(input) {
//   if (input.files && input.files[0]) {
//     var reader = new FileReader();
//
//     reader.onload = function (e) {
//       $('#image-preview').attr('src', e.target.result);
//     }
//
//     reader.readAsDataURL(input.files[0])
//   }
// }
//
// $('#image-upload').change(function() {
//   readURL(this);
// });

var loadFile = function(event) {
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};
