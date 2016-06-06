angular.module 'landing'
  .config ($translateProvider) ->
    $translateProvider.useLocalStorage()
  .controller 'LangSwitcherCtrl', ($translate) ->
    @langs = ['ru', 'en']

    @_selectedLang = $translate.use()

    @selected = (lang) ->
      @_selectedLang is lang

    @select = (lang) ->
      @_selectedLang = lang

      $translate.use lang

