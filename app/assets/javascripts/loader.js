(function(){
  var percentLoaded = 0;
  var loading = setInterval(function(){
    $('.progress-bar').css("width", percentLoaded + "%");
    if (percentLoaded >= 100)
      clearInterval(loading);
    else
      {
        console.log(percentLoaded);
        percentLoaded++;
        $('.progress-bar').css("width", percentLoaded + "%");
      }
  },1);
})();

var hideProgressBar = function(){
  var bar = document.querySelector(".progress");
  document.body.removeChild(bar);
}