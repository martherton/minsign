$(document).ready(function(){
  if ($('#draft_sourcetype').length) {
  var itemname = document.getElementById('draft_sourcetype').value;
  if (itemname.length === 0)
  {}
  else
  {
  $('#' + itemname).show();  
    }
  }

});


$(document).ready(function(){
    
    
    $('#draft_sourcetype').on('change', function() {
      if ( this.value == 'Website')
      //.....................^.......
      {
        $("#Website").show();
      }
      else
      {
        $("#Website").hide();
      }
    });
    $('#draft_sourcetype').on('change', function() {
      if ( this.value == 'Meeting')
      //.....................^.......
      {
        $("#Meeting").show();
      }
      else
      {
        $("#Meeting").hide();
      }
    });
    $('#draft_sourcetype').on('change', function() {
      if ( this.value == 'Other Publication')
      //.....................^.......
      {
        $("#Otherpub").show();
      }
      else
      {
        $("#Otherpub").hide();
      }
    });
    $('#draft_sourcetype').on('change', function() {
      if ( this.value == 'Book')
      //.....................^.......
      {
        $("#Book").show();
      }
      else
      {
        $("#Book").hide();
      }
    });
    $('#draft_sourcetype').on('change', function() {
      if ( this.value == 'Lecture')
      //.....................^.......
      {
        $("#Lecture").show();
      }
      else
      {
        $("#Lecture").hide();
      }
    });
    $('#draft_sourcetype').on('change', function() {
      if ( this.value == 'Brainstorm')
      //.....................^.......
      {
        $("#Brainstorm").show();
      }
      else
      {
        $("#Brainstorm").hide();
      }
    });
    
});
$(document).ready(function(){

$('#draft_topic').on('change', function() {
      if ( this.value == '')
      //.....................^.......
      {
        $("#newtopics").modal('show');
      }
      else
      {
        $("#newtopics").hide();
      }
    });
});    

$(document).ready(function(){
    $('#draft_sourcetype').load('load', function() {
      if ( this.value == 'Meeting')
      //.....................^.......
      {
        $("#Meeting").show();
      }
      else
      {
        $("#Meeting").hide();
      }
    });
    $('#draft_sourcetype').load('load', function() {
      if ( this.value == 'Brainstorm')
      //.....................^.......
      {
        $("#Brainstorm").show();
      }
      else
      {
        $("#Brainstorm").hide();
      }
    });
    $('#draft_sourcetype').load('load', function() {
      if ( this.value == 'Lecture')
      //.....................^.......
      {
        $("#Lecture").show();
      }
      else
      {
        $("#Lecture").hide();
      }
    });
    $('#draft_sourcetype').load('load', function() {
      if ( this.value == 'Other Publication')
      //.....................^.......
      {
        $("#Otherpub").show();
      }
      else
      {
        $("#Otherpub").hide();
      }
    });
    $('#draft_sourcetype').load('load', function() {
      if ( this.value == 'Website')
      //.....................^.......
      {
        $("#Website").show();
      }
      else
      {
        $("#Website").hide();
      }
    });
 });   
