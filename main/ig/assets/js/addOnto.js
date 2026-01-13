var url = new URL($('#newissue').attr('href'));
url.searchParams.set('title', $('#idValue').val() );
$('#newissue').attr('href',url)




$(document).ready(function(){


  if ( $("#divDemande").length ) {
 
    
    $.ajax({
        type: 'get',
        url: "https://api.github.com/search/issues?q=is:issue " +  $('#idValue').val()  + " repo:ansforge/IG-terminologie-de-sante",
        contentType: 'application/json',  
        dataType:"json",     
      })
        .done((data) => {
    
          if (data.items != null) {   
            $('#divDemande').html('<div id="demande"><table class="grid table table-bordered"> <thead> <tr> <td> </td> <td>Titre</td>        <td>Auteur</td>        <td>Date</td>    </tr></thead>    <tbody id="idDemande"> </tbody> </table>  </div>	      	      ');

            $.each(data.items, function (i, obj) { 
            var content = '<tr>' ;
            content += '<td>'+  obj.state +'</td><td><a  target="_blank"  href="https://github.com/ansforge/IG-terminologie-de-sante/issues/'+ obj.number  +'"> ' + obj.title +'</a></td><td>' + obj.user.login + '</td><td>' + obj.created_at  + '</td>';
            content += '</tr>';
            $('#idDemande').append(content);
            
            
          

    
            });
    
         }   
        })
        .fail((err) => {
          console.error(err);
        })
        .always(() => {
          });
    
    
        






  }




    if ( $("#divHistoire").length ) {
    $('#divHistoire').html('<div id="histoire"><table class="grid table table-bordered"> <thead> <tr> <td>Histoire</td> <td>Version</td>        <td>Demande</td>       <td>Resultat</td> <td>Date</td>    </tr></thead>    <tbody id="idHistoire"> </tbody> </table>  </div>	      	      ');
    
    
    $.ajax({
        type: 'get',
        url: "https://smt.esante.gouv.fr/fhir/" + $('#typeValue').val() + "/" + $('#idValue').val() + "/_history?_summary=true",
        contentType: 'application/json',  
        dataType:"json",     
      })
        .done((data) => {
    
          if (data.entry != null) {   
            $.each(data.entry, function (i, obj) { 
            var content = '<tr>' ;
            content += '<td style="background-color: #C5C8DA;color:white">'+  obj.resource.meta.versionId +'</td><td  style="background-color: #C5C8DA;color:white">' + obj.resource.version +'</td><td style="background-color: #C5C8DA;color:white">' + obj.request.method  +'</td><td style="background-color: #C5C8DA;color:white"> ' + obj.response.status  + '</td><td style="background-color: #C5C8DA;color:white"> '+ obj.response.lastModified  +'</td>';
            content += '</tr>';
            $('#idHistoire').append(content);
            
            
            content ='<tr><td colspan="5"><table style="font-size:10px;width:100%" class="table-striped"><tr><tr><td  style="background-color: #697097;color:white">Operation</td><td  style="background-color: #697097;color:white">Chemin</td  style="background-color: #697097;color:white"><td style="background-color: #697097;color:white">Nom</td><td  style="background-color: #697097;color:white">Valeur</td> <td  style="background-color: #697097;color:white">Précédent</td></tr><tbody id="histoire'+ obj.resource.meta.versionId + '"></tbody></tr></table></td></tr>';		
            console.log("https://smt.esante.gouv.fr/fhir/" + obj.id  +  "/$diff");   
            $('#idHistoire').append(content);          
                $.ajax({
                type: 'get',
                url: "https://smt.esante.gouv.fr/fhir/" + obj.id  +  "/$diff",
                contentType: 'application/json',  
                dataType:"json",     
              })
                .done((data) => {
                  if (data.parameter != null) {   
                    $.each(data.parameter, function (i, obj2) { 
                        var operation = "";
                        var chemin  = "";
                        var nom  = "";
                        var precedent ="";
                        var valeur ="";
                        $.each(obj2.part, function (ipart, objPart) { 
                            if(Object.values(objPart)[0] == "type")
                                operation = Object.values(objPart)[1];
                            if(Object.values(objPart)[0] == "path")
                                chemin = Object.values(objPart)[1];          
                            if(Object.values(objPart)[0] == "name")
                                nom = Object.values(objPart)[1];                          
                            if(Object.values(objPart)[0] == "value")
                                valeur = Object.values(objPart)[1];     
                            if(Object.values(objPart)[0] == "previousValue")
                                precedent = Object.values(objPart)[1];                                                
                        });
                    content = '<tr><td>' + operation +'</td><td>' + chemin +'</td><td> ' + nom+ '</td><td> '+  valeur +'</td><td>' + precedent  +  '</td></tr>'; 
                     $('#histoire'+obj.resource.meta.versionId).append(content);    
                    
    
                    });
                 }   
                });		
    
            });
    
         }   
        })
        .fail((err) => {
          console.error(err);
        })
        .always(() => {
          });
    
    
        
    
        
    };
    
    
    
    
    
    
    
    
    
        

    
        
        $("#terminologit-search-content-valueset-cld").addClass("accordion-group");
        //$("#terminologit-search-content-valueset-cld").attr("id","logical-definition-accordion-group");
        var logicalDefHeading = $("#terminologit-search-content-valueset-cld").find("#logical-definition-cld");
        $(logicalDefHeading).addClass("accordion-heading");
        $(logicalDefHeading).append('<a class="accordion-toggle" data-toggle="collapse" href="#logical-definition-cld-collapse"><i class="gg-chevron-down"></i></a>');
        $(logicalDefHeading).next().addClass("accordion-body collapse in");
        $(logicalDefHeading).next().attr('id', 'logical-definition-cld-collapse');
    
        $('.gg-chevron-down').each(function () {
            $(this).click(function () {
                jQuery(this).toggleClass("rotate-toggle");
            });
        });
    
        
         $(window).scroll(function () {
                if ($(this).scrollTop() > 50) {
                    $('#back-to-top').fadeIn();
                } else {
                    $('#back-to-top').fadeOut();
                }
            });
            // scroll body to 0px on click
            $('#back-to-top').click(function () {
                $('#back-to-top').tooltip('hide');
                $('body,html').animate({
                    scrollTop: 0
                }, 800);
                return false;
            });
    
            $('#back-to-top').tooltip('show');

    
    $('#ontoSearch').on( "change", function() {
      $('#resultOnto').html("Recherche ...");
      $('#counterOnto').html("");
      resultOnto      
      $.ajax({
        type: 'get',
        url: "https://smt.esante.gouv.fr/fhir//ValueSet/" + $('#idValue').val() + "/$expand?_format=json&filter=" + $('#ontoSearch').val(),
        contentType: 'application/json',  
        dataType:"json",     
      })
        .done((data) => {
          $('#resultOnto').html("");
          $('#counterOnto').html(data.expansion.total + ' item');
          if (data.expansion.contains != null) {   
            $('#resultOnto').html('<table  class="codes table table-bordered  table-striped"><thead><tr><th><b>Code</b></th><th><b>System</b></th><th><b>Display</b></th></tr></thead><tbody id="bodyOntoTable"></tbody></table>');
            $.each(data.expansion.contains, function (i, obj) { 
            var content = '<tr>' ;
            content += '<td  >' + obj.code +'</td><td  >' + obj.system+'</td><td  >' + obj.display+'</td>';
            content += '</tr>';
             $('#bodyOntoTable').append(content);
            });
         }   
        })
        .fail((err) => {
          console.error(err);
        })
        .always(() => {
          $('#requeteOnto').html("GET https://smt.esante.gouv.fr/fhir/ValueSet/"+ $('#idValue').val()  + "/$expand?_format=json&&filter=" + $('#ontoSearch').val());
        });
    });      
    
    
    
    $('#orig').find('table').not(".grid").each(function(indextable) { 
      if($(this).find("tr").length ==1) {
        $(this).parent().hide();
    }
        $('<div class="form-group pull-right"> <input type="text"  style="height:auto;font-size:12px" class="search' + indextable +' form-control" placeholder="Recherche">  <span class="counter' + indextable + ' "></span></div>').insertBefore($(this));	
        firstTr = $(this).find('tr:first').remove()
        firstTr.find('td').contents().unwrap().wrap('<th>')
        $(this).prepend($('<thead></thead>').append(firstTr))
        $(this).addClass("results"+indextable); 
          $(this).addClass("table-striped");
    
      $(".search"+indextable).keyup(function () {
        var searchTerm = $(".search"+indextable).val();
        var listItem = $('.results'+indextable +' tbody').children('tr');
        var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
        
      $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
            return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        }
      });
        
      $(".results"+indextable +" tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
        $(this).attr('visible','false');
      });
    
      $(".results"+indextable +" tbody tr:containsi('" + searchSplit + "')").each(function(e){
        $(this).attr('visible','true');
      });
    
      if(searchSplit=="") {
        $(".results"+indextable +" tbody tr").attr('visible','true');
        $('.counter'+indextable).text("");
      }
    
      var jobCount = $('.results'+indextable +' tbody tr[visible="true"]').length;
        $('.counter'+indextable).text(jobCount + ' item');
    
      if(jobCount == '0') {$('.no-result').show();}
        else {$('.no-result').hide();}
              });
        
    });
    
  $('#origConceptMap').find('table').each(function(indextable) { 
      if($(this).find("tr").length ==1) {
        $(this).parent().hide();
    }
        $('<div class="form-group pull-right"> <input type="text"  style="height:auto;font-size:12px" class="search' + indextable +' form-control" placeholder="Recherche">  <span class="counter' + indextable + ' "></span></div>').insertBefore($(this));	
        firstTr = $(this).find('tr:first').remove()
        firstTr.find('td').contents().unwrap().wrap('<th>')
        $(this).prepend($('<thead></thead>').append(firstTr))
        $(this).addClass("results"+indextable); 
          $(this).addClass("table-striped");
    
      $(".search"+indextable).keyup(function () {
        var searchTerm = $(".search"+indextable).val();
        var listItem = $('.results'+indextable +' tbody').children('tr');
        var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
        
      $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
            return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        }
      });
        
      $(".results"+indextable +" tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
        $(this).attr('visible','false');
      });
    
      $(".results"+indextable +" tbody tr:containsi('" + searchSplit + "')").each(function(e){
        $(this).attr('visible','true');
      });
    
      if(searchSplit=="") {
        $(".results"+indextable +" tbody tr").attr('visible','true');
        $('.counter'+indextable).text("");
      }
    
      var jobCount = $('.results'+indextable +' tbody tr[visible="true"]').length;
        $('.counter'+indextable).text(jobCount + ' item');
    
      if(jobCount == '0') {$('.no-result').show();}
        else {$('.no-result').hide();}
              });
        
    });


    
    if($("table.codes").find('tr:eq(0) th:eq(4)').text()=='dateFin')
        $("table.codes tr td:nth-child(5):not(:empty)").parent().children().css("background-color","#E69215");     

    if($("table.codes").find('tr:eq(0) th:eq(5)').text()=='dateFin')
        $("table.codes tr td:nth-child(6):not(:empty)").parent().children().css("background-color","#E69215");   

    $("#orig").find("code").css("background-color","#464c6d");
    $("#orig").find("code").css("color","white");
    $("#orig").find("code").css("font-weight","bolder");
    $("#orig").find("code").css("font-size","14px");
        


  
    });


