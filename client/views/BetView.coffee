class window.BetView extends Backbone.View
  className: 'bet'

  template: _.template '<img class="chip" id="5" src="img/chips/5.png">
                        <img class="chip" id="25" src="img/chips/25.png">
                        <img class="chip" id="50" src="img/chips/50.png">'

  initialize: ->
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template
