// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

      $(function()
            {
            var logged_in = $("li.signin a").attr('text') == 'Login' ? false : true ;
            $(".banner a").click(function(e) {  
               if(logged_in == false){
                 window.location = $("li.signin a").attr('href');
                 e.preventDefault();
               }  
            });
          });

