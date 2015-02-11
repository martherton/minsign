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
            hide: {
                event: 'click' 
            },
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
            hide: {
                event: 'click' 
            },
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
            hide: {
                event: 'click' 
            },
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
            hide: {
                event: 'click' 
            },
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
            hide: {
                event: 'click' 
            },
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
            hide: {
                event: 'click' 
            },
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
            hide: {
                event: 'click' 
            },
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
            hide: {
                event: 'click' 
            },
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
            hide: {
                event: 'click' 
            },
                style: {
                    classes: 'qtip-tipped',
                    height: 100
                }
         });
     });
 });