$( document ).ready(function() {
    $("#searchForm").submit(function(e){ 
        e.preventDefault(); 
        urlSearch = "https://search.brave.com/search?q=site:";
        hrefurl=$(location).attr("href");
        urlSearch += hrefurl.substr(0,hrefurl.lastIndexOf('/') + 1);
        urlSearch += "+" + $("#q").val();
        window.open(urlSearch, '_blank');
    });
  });