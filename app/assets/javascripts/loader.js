var loadingBar = function(){
  var percentLoaded = 0;
  var loading = setInterval(function(){
    $('.progress-bar').css("width", percentLoaded + "%");
    if (percentLoaded >= 100)
      clearInterval(loading);
    else
      {
        percentLoaded++;
        $('.progress-bar').css("width", percentLoaded + "%");
      }
  },1);
}