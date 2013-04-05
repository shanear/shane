$(document).ready ->
  # Set the margin of the first section to push the second right beneath the fold
  $topSection = $('.content-section.top')
  offscreenMargin = window.innerHeight - $topSection.height()
  if offscreenMargin > 0
    $topSection.css('margin-bottom',
      window.innerHeight - $topSection.height())

  $("#navigation a").click ->
    href = $(this).attr("href");
    $el = $(href);

    $("html, body").animate(
      # TODO: 70 should references $header height
      {"scrollTop": $el.offset().top - 70}, 500
    )
    return false

  $(window).scroll ->
    $("nav a").removeClass("active")

    scrollTop = $(window).scrollTop() + $("header").height() + 10;

    if(scrollTop > $("#contact").position().top)
      $("a[href='#contact']").addClass("active")
    else if(scrollTop > $("#blog").position().top)
      $("a[href='#blog']").addClass("active")
    else if(scrollTop > $("#portfolio").position().top)
      $("a[href='#portfolio']").addClass("active")
    else
      $("a[href='#about']").addClass("active")
