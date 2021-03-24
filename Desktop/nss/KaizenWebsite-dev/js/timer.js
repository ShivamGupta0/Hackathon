var clock = document.getElementById("clockdiv")
var daysSpan = clock.querySelector(".days")
var hoursSpan = clock.querySelector(".hours")
var minutesSpan = clock.querySelector(".minutes")
var secondsSpan = clock.querySelector(".seconds")
var countDownDate = new Date("March 30, 2021 00:00:00").getTime()
var x = setInterval(function () {
    var now = new Date().getTime()
    var distance = countDownDate - now
    var days = Math.floor(distance / (1000 * 60 * 60 * 24))
    var hours = Math.floor(
        (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
    )
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
    var seconds = Math.floor((distance % (1000 * 60)) / 1000)
    daysSpan.innerHTML = days
    hoursSpan.innerHTML = ("0" + hours).slice(-2)
    minutesSpan.innerHTML = ("0" + minutes).slice(-2)
    secondsSpan.innerHTML = ("0" + seconds).slice(-2)
    if (distance < 0) {
        clearInterval(x)
        document.getElementBy("demo").innerHTML = "HAPPY NEW YEAR!"
    }
}, 1000)
