(function(){
  var percentLoaded = 0;
  {
    var loading = setInterval(function(){
      console.log(document.readyState);
      $('.progress-bar').css("width", percentLoaded + "%");
      document.querySelector(".progress-bar").textContent = percentLoaded;
      if (percentLoaded >= 100)
      {
        clearInterval(loading);
        hideProgressBar();
      }
      else if (document.readyState == "loading")
      {
        percentLoaded += 25;
      }
      else if (document.readyState == "loaded")
      {
        percentLoaded += 25;
      }
      else if (document.readyState == "interactive")
      {
        percentLoaded += 25;
      }
      else if (document.readyState == "complete")
      {
        percentLoaded += 25;
      }
    },1)
  };
})();

var hideProgressBar = function(){
  $('.progress').css("display", "none");
}