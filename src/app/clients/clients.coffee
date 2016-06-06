"use strict"

angular.module("landing").controller "ClientsCtrl", ($scope) ->

  loadReview = ->
    maxHeightReviews = -1
    revsTimer = undefined

    rightClickReview = ->
      active = $('.reviewActive')
      if active.next().hasClass('review')
        active.removeClass('reviewActive').next().addClass 'reviewActive'
      else
        active.removeClass 'reviewActive'
        $('.review').eq(0).addClass 'reviewActive'

    leftClickReview = ->
      active = $('.reviewActive')
      if active.prev().hasClass('review')
        active.removeClass('reviewActive').prev().addClass 'reviewActive'
      else
        active.removeClass 'reviewActive'
        $('.review').last().addClass 'reviewActive'

    #start the animation
    clearStartReviewsInterval = (startAnim) ->
      clearInterval revsTimer
      #$("#reviewsTimerBar").stop().css('left', '-100%');
      if startAnim
        revsTimer = setInterval((->
          #$("#reviewsTimerBar").stop().css('left', '-100%');
          #$("#reviewsTimerBar").animate({left : '0'}, 5000);
          rightClickReview()
        ), 10000)

    maxHeightReviews = 0
    $('.reviewCloud').show()
    $('.reviewCloud').each ->
      console.log $(this).height()
      maxHeightReviews = if maxHeightReviews > $(this).height() then maxHeightReviews else $(this).height()

    $('.reviewsWrap').height maxHeightReviews + 250
    $('.review').eq(0).addClass 'reviewActive'

    #click right
    $('.revNaviRight').click ->
      rightClickReview()
      clearStartReviewsInterval true

    #click left
    $('.revNaviLeft').click ->
      leftClickReview()
      clearStartReviewsInterval true

    clearStartReviewsInterval true

    $('.review').hover (->
      clearInterval revsTimer
      #$("#reviewsTimerBar").stop().css('left', '-100%');
    ), ->
      clearStartReviewsInterval true


  # ------------------------------
  sendMail = ->
    $('#sendmail').on 'submit', (event) ->
      event.preventDefault()
      $('.fa-form-wait').css 'display', 'inline-block'
      $.ajax
        type: 'POST'
        url: $('#sendmail').attr('action')
        data: $('#sendmail').serialize()
        success: () ->
          $('.fa-form-wait').hide()
          $('#formSubmitMessage').show()
          $('#sendmail').slideUp()


  # ------------------------------
  resizeView = ->
    doit = undefined

    resizedw = ->
    #reviews
      $('.reviewCloud').each ->
        maxHeightReviews = if maxHeightReviews > $(this).height() then maxHeightReviews else $(this).height()
      $('.reviewsWrap').height maxHeightReviews + 250
      #screens
      if $(window).width() < 768
        $('.screen-item').width $('.screensViewport').width()
      else
        $('.screen-item').width 260
      $('.screen-item-active').removeClass 'screen-item-active'
      $('.screen-item').eq(0).addClass 'screen-item-active'
      $('.screensPanel').css 'left', '0'
      #slider
      $('.sliderWrap img').each ->
        dis = $('this')
        dis.css 'margin-left', '-' + dis.width() / 2 + 'px'

    window.onresize = ->
      clearTimeout doit
      doit = setTimeout(resizedw, 300)

  #    $('a[data-gal^=\'prettyPhoto\']').prettyPhoto
  #      theme: 'dark_rounded'
  #      social_tools: ''
  #      hook: 'data-gal'


  # ------------------------------
  loadSlider = ->

    return true

  #    rightSliderMove = ->
  #      activeSlider = $('.sliderActive')
  #      if activeSlider.next().hasClass('sliderImg')
  #        activeSlider.removeClass('sliderActive').next().addClass 'sliderActive'
  #      else
  #        activeSlider.removeClass 'sliderActive'
  #        $('.sliderWrap img').eq(0).addClass 'sliderActive'
  #      $('.sliderButtonActive').removeClass 'sliderButtonActive'
  #      $('.sliderButton').eq($('.sliderActive').index()).addClass 'sliderButtonActive'
  #
  #    leftSliderMove = ->
  #      activeSlider = $('.sliderActive')
  #      if activeSlider.prev().hasClass('sliderImg')
  #        activeSlider.removeClass('sliderActive').prev().addClass 'sliderActive'
  #      else
  #        activeSlider.removeClass 'sliderActive'
  #        $('.sliderWrap img').last().addClass 'sliderActive'
  #
  #    $('.sliderWrap img').each ->
  #      dis = $(this)
  #      dis.css 'margin-left', '-' + dis.width() / 2 + 'px'
  #      $('.sliderButtons').append '<div class=\'sliderButton\'></div>'
  #
  #    $('.sliderWrap img').eq(0).addClass 'sliderActive'
  #    $('.sliderButton').eq(0).addClass 'sliderButtonActive'
  #
  #    $('.sliderButton').click ->
  #      if $(this).hasClass('sliderButtonActive')
  #        return
  #      ind = $(this).index()
  #      $('.sliderActive').removeClass 'sliderActive'
  #      $('.sliderWrap img').eq(ind).addClass 'sliderActive'
  #      $('.sliderButtonActive').removeClass 'sliderButtonActive'
  #      $(this).addClass 'sliderButtonActive'
  #      clearInterval sliderTimer
  #      sliderTimer = setInterval(rightSliderMove, 6000)
  #
  #    sliderTimer = setInterval(rightSliderMove, 15000)


  # ------------------------------
  mainMenu = ->
    $('.mainMenu').clone().prependTo '#followMenu'
    topMenuHeight = 0

    $('.mainMenu a, .headerButton').click (e) ->
      e.preventDefault()
      target = $(this).attr('href')
      $('html,body').animate { scrollTop: $(target).offset().top - topMenuHeight }, 800



  # ------------------------------
  loadScroll = ->
    folMenu = $('#followMenu')
    resMenuToggle = $('#responsiveMenuToggle')
    lastId = undefined
    topMenu = $('#followMenu .mainMenu')
    topMenuHeight = 70
    menuItems = topMenu.find('a')
    headerHeight = $('#topContainer').height()

    scrollItems = menuItems.map(->
      item = $($(this).attr('href'))
      if item.length
        return item
    )

    $(window).scroll ->
    # Get container scroll position
      fromTop = $(this).scrollTop() + topMenuHeight
      # Get id of current scroll item
      cur = scrollItems.map(->
        if $(this).offset().top <= fromTop + 5
          return this
      )
      # Get the id of the current element
      cur = cur[cur.length - 1]
      id = if cur and cur.length then cur[0].id else ''
      if lastId != id
        lastId = id
        # Set/remove active class
        menuItems.parent().removeClass('menuActive').end().filter('[href=#' + id + ']').parent().addClass 'menuActive'
      if headerHeight != 0 and $(window).scrollTop() + 80 > headerHeight
        if !folMenu.hasClass('fmshown')
          folMenu.addClass 'fmshown'
          #folMenu.stop().fadeIn(300);
      else
        if folMenu.hasClass('fmshown')
          folMenu.removeClass 'fmshown'
          #folMenu.stop().fadeOut(300);
    #animate numbers
    #animateNumbers();

    resMenuToggle.click ->
      if !folMenu.hasClass('fmToggled')
        folMenu.addClass 'fmToggled'
        #folMenu.stop().fadeIn(300);
      else if folMenu.hasClass('fmToggled')
        folMenu.removeClass 'fmToggled'
        #folMenu.stop().fadeOut(300);

    $('a', folMenu).click ->
      folMenu.removeClass 'fmToggled'

    #add menu on refresh
    if headerHeight != 0 and $(window).scrollTop() + 80 > headerHeight
      folMenu.addClass 'fmshown'

    return true


  # ------------------------------
  loadBG = ->

    return true

    #    header = document.getElementById('topContainer')
    #    xPercent = undefined
    #    yPercent = undefined
    #    wireframe = document.querySelector('.wireframe1')
    #    wireframe2 = document.querySelector('.wireframe2')
    #    w = window.innerWidth
    #    h = window.innerHeight
    #    mouseX = 0
    #    mouseY = 0
    #    xp = 0
    #    yp = 0
    #    #if (mozRequestAnimationFrame);
    #
    #    bgStep = (timestamp) ->
    #      xp += (mouseX - xp) / 6
    #      yp += (mouseY - yp) / 6
    #      xPercent = Math.round(xp / w * 300) - 150
    #      yPercent = Math.round(yp / wireframe.clientHeight * 300) - 150
    #      if xPercent > -10 and xPercent < 10
    #        xPercent = 1
    #      if yPercent > -10 and yPercent < 10
    #        yPercent = 1
    #      #console.log(xPercent);
    #      wireframe.style.transform = 'rotateY(' + xPercent / 10 + 'deg) rotateX(' + yPercent / 10 + 'deg) scale(1.2)'
    #      #wireframe2.style.transform = "rotateY("+-xPercent+"deg) rotateX("+-yPercent+"deg)";
    #      window.requestAnimationFrame bgStep
    #
    #    header.onmousemove = (event) ->
    #      mouseX = event.clientX
    #      mouseY = event.clientY
    #      return
    #
    #    window.requestAnimationFrame bgStep
    #
    #    return true

  loadImgs = ->
    imageObj = new Image()
    path = '/assets/images/v2/slider/'
    images = new Array()
    images[0]="picture-rus.png"
    images[1]="picture-eng.png"
    i = 0
    while i <= images.length-1
      imageObj.src = path + images[i]
      i++


  loadBG()
  sendMail()
  loadImgs()

  $( document ).ready(->
    setTimeout(->
      loadReview()
      resizeView()
    , 500)
  );

  $(window).load ->
    loadSlider()
    mainMenu()
    loadScroll()
