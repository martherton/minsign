function reloadStylesheets() {
    var queryString = '?reload=' + new Date().getTime();
    $('link[rel="stylesheet"]').each(function () {
        this.href = this.href.replace(/\?.*|$/, queryString);
    });
}


$.browser.chrome = /chrom(e|ium)/.test(navigator.userAgent.toLowerCase()); 

if($.browser.chrome){
reloadStylesheets() ;
}