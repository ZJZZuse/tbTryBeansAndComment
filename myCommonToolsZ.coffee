window.myCommonToolsZ =

  fireActionAtDomAppear: (selector, action, delay = 100) ->
    $('body').on('DOMSubtreeModified',
      ->
        if $(selector).length != 0

          setTimeout(->
            action($(selector))
          , delay)
    )

  fireActionInCondition: (condtionF, action, delay = 100) ->
    $('body').on('DOMSubtreeModified',
      ->
        if condtionF.call()
          setTimeout(->
            action.call()
          , delay)
    )

  fireActionByCusCondition: (condtionF, action, interval = 100, delay = 100) ->
    idT = setInterval(->
      if condtionF()

        clearInterval(idT)

        setTimeout(->
          action()
        , delay)

    , interval)

  repeatStr: (str, times = 2)->
    gStrs = []

    while times--
      gStrs.push str

    gStrs.join("")

  insertBtn: (text, action)->
    idT = "myActionBtn" + new Date().getTime()

    $("body").prepend('<button id = ' + idT + '>' + text + '</button>');

    setTimeout(
      ->
        $('#' + idT).on('click', action)
    , 500)
