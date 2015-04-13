// Using qtip2 to pull in the appropriate part of the instruction documenttion



$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#topic').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Topics',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#sandtopicenter');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#newtopic').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Enter a new topic',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#newtopicenter');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#heading').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Heading',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#sandheading');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#newheading').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Enter a new heading',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#enternewheading');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#urlentry').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Enter the source url(web address)',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#urlentryinfo');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#textenter').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Enter the information',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#textentry');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#typedata').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Classify the type of data',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#datatype');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#enterdate').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Review date',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#dateenter');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#searchhelp').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Search help',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#helpsearch');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });
$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#currentissues').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Current Issues',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#issuescurrent1');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });

$(document).ready(function()
 {
     // MAKE SURE YOUR SELECTOR MATCHES SOMETHING IN YOUR HTML!!!
     $('#calendarprompt').each(function() {
         $(this).qtip({
            content: {
                button: true,
                title: 'Event Calendar',
                text: function(event, api) {
                    $.ajax({
                        url: api.elements.target.attr('href') // Use href attribute as URL
                    })
                    .then(function(content) {
                        // Set the tooltip content upon successful retrieval
                        var elements = $("<div />").append( $.parseHTML(content) ).find('#calendar1');
                        api.set('content.text', elements);
                    }, function(xhr, status, error) {
                        // Upon failure... set the tooltip content to error
                        api.set('content.text', status + ': ' + error);
                    });
        
                    return 'Loading...'; // Set some initial text
                }
            },
            position: {
                viewport: $(window),
                my: 'bottom left',  // Position my top left...
                at: 'top right', // at the bottom right of...
                target: $('#helpicon a')
            },
            hide: { event: 'mouseout' },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });
//refresh draft edit partial for book
$(document).ready(function() {
  $("#draft_book_attributes_ISBN").keyup(function() {
    
     $.ajax({
        url : "/drafts/bookdata",
        data : "html", 
        type: "GET",
        success : function(data) {
          $("div#booker").html(data)
        }
     });
    
  });
});

//drop down menu

( function( $ ) {
$( document ).ready(function() {
$('#cssmenu').prepend('<div id="indicatorContainer"><div id="pIndicator"><div id="cIndicator"></div></div></div>');
    var activeElement = $('#cssmenu>ul>li:first');

    $('#cssmenu>ul>li').each(function() {
        if ($(this).hasClass('active')) {
            activeElement = $(this);
        }
    });


    var posLeft = activeElement.position().left;
    var elementWidth = activeElement.width();
    posLeft = posLeft + elementWidth/2 -6;
    if (activeElement.hasClass('has-sub')) {
        posLeft -= 6;
    }

    $('#cssmenu #pIndicator').css('left', posLeft);
    var element, leftPos, indicator = $('#cssmenu pIndicator');
    
    $("#cssmenu>ul>li").hover(function() {
        element = $(this);
        var w = element.width();
        if ($(this).hasClass('has-sub'))
        {
            leftPos = element.position().left + w/2 - 12;
        }
        else {
            leftPos = element.position().left + w/2 - 6;
        }

        $('#cssmenu #pIndicator').css('left', leftPos);
    }
    , function() {
        $('#cssmenu #pIndicator').css('left', posLeft);
    });

    $('#cssmenu>ul').prepend('<li id="menu-button"><a>Menu</a></li>');
    $( "#menu-button" ).click(function(){
            if ($(this).parent().hasClass('open')) {
                $(this).parent().removeClass('open');
            }
            else {
                $(this).parent().addClass('open');
            }
        });
});
} )( jQuery );

$( document ).ready(function() {
    $("#draft_draftnotes").blur(function() {
     $(this).parents("form").submit()
 });
    $("#draft_title").blur(function() {
     $(this).parents("form").submit()
 });


});    

$( document ).ready(function() {

  // hide spinner
  $("#spinner").hide();


  // show spinner on AJAX start
  $(document).ajaxStart(function(){
    $("#spinner").show();
  });

  // hide spinner on AJAX stop
  $(document).ajaxStop(function(){
    $("#spinner").hide();
  });

});


