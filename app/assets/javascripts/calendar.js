;$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        
        events: '/event.json',
        header: {
    left:   'title',
    center: 'month,basicWeek, basicDay',
    right:  'today prev,next'
}
    })

});

