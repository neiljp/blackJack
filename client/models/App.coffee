#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'message',''
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('dealerHand').on 'gameOver', @.compareScores, @

  compareScores: ->
    console.log 'Game Over'
    dealerScore = @get('dealerHand').scores()
    playerScore = @get('playerHand').scores()

    console.log dealerScore,playerScore

    if dealerScore > 21
      @set 'message', 'Dealer Busts, You Win'
    else if dealerScore > playerScore
      @set 'message', 'Dealer Wins Sucka!!'
    else if dealerScore < playerScore
      @set 'message', 'You Win for now!'
    else
      @set 'message', 'Keep the money, you filthy animal'
