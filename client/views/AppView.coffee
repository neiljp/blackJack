class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="new-game-button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="current-bet-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="result-message-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('dealerHand').stand()
    "click .chip": (e) ->
      @model.set 'currentBet', (parseInt(@model.get 'currentBet') + parseInt(e.currentTarget.id))
    "click .new-game-button": ->
      $('body').children().remove()
      new AppView(model: new App(@model.get('moneyPot'))).$el.appendTo 'body'

  initialize: ->
    @model.on 'change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.current-bet-container').html new BetView().el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.result-message-container').html @.model.get('message')
