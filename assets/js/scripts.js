/** External Links **/

function externalLinks() {
    if (!document.getElementsByTagName) return;
    const anchors = document.getElementsByTagName("a");
    for (let i = 0; i < anchors.length; i++) {
        const anchor = anchors[i];
        if (anchor.getAttribute("href") && anchor.getAttribute("rel") === "external") anchor.target = "_blank";
    }
}

function getRandomDateWithinNextMonth() {
    const now = new Date();
    const oneMonthLater = new Date(now.getFullYear(), now.getMonth() + 1, now.getDate());
    const randomTime = now.getTime() + Math.random() * (oneMonthLater.getTime() - now.getTime());
    return new Date(randomTime);
}

window.onload = externalLinks;

/** Countdown Timer **/
$(document).ready(function () {
    "use strict";

    const randomDate = getRandomDateWithinNextMonth();
    const formattedDate = new Intl.DateTimeFormat('en-GB', {
        day: '2-digit',
        month: 'long',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        hour12: false
    }).format(randomDate).replace('at', '');
    console.log(formattedDate);
    $("#countdown").countdown({
        date: formattedDate, /** Enter new date here **/
        format: "on"
    });
});

