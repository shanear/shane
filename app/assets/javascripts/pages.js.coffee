$(document).ready ->
  # Make each section at least occupy an entire page
  $('.content-section:not(#footer)').each (i, section)->
    console.log "section" + i
    $section = $(section)
    offscreenMargin = window.innerHeight - $section.height()
    if offscreenMargin > 0
      $section.css('margin-bottom', window.innerHeight - $section.height())

  $("nav a").click ->
    href = $(this).attr("href")
    $el = $(href)

    $(this).blur()
    $("html, body").animate(
      # TODO: 70 should references $header height
      {"scrollTop": $el.offset().top }, 500
    )
    return false

  $(window).scroll ->
    $("nav a").removeClass("active")

    scrollTop = $(window).scrollTop() + $("header").height() + 10;

    if(scrollTop > $("#mom").position().top)
      $("a[href='#mom']").addClass("active")
    else if(scrollTop > $("#contact").position().top)
      $("a[href='#contact']").addClass("active")
    else if(scrollTop > $("#blog").position().top)
      $("a[href='#blog']").addClass("active")
    else #if(scrollTop > $("#portfolio").position().top)
      $("a[href='#portfolio']").addClass("active")
