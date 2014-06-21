#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: (pot) ->
    currentBet = prompt("Whats your bet?")
    @set 'currentBet', parseInt(currentBet)

    @set 'moneyPot', parseInt(pot)
    @set 'message',''
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on 'gameOver', @compareScores, @
    @get('playerHand').on 'gameOver', @compareScores, @

  compareScores: ->
    console.log 'Game Over'
    dealerScore = @get('dealerHand').scores()
    playerScore = @get('playerHand').scores()

    # console.log @get 'currentBet'
    console.log dealerScore,playerScore
    if playerScore > 21
      @set 'moneyPot', (parseInt(@get 'moneyPot') - parseInt(@get 'currentBet'))
      console.log "New Pot is #{@get 'moneyPot'}"
      @set 'message', 'Busted!'
    else if dealerScore > 21
      @set 'moneyPot', (parseInt(@get 'moneyPot') + parseInt(@get 'currentBet'))
      console.log "New Pot is #{@get 'moneyPot'}"
      @set 'message', 'Dealer Busts, You Win'
    else if dealerScore > playerScore
      @set 'moneyPot', (parseInt(@get 'moneyPot') - parseInt(@get 'currentBet'))
      console.log "New Pot is #{@get 'moneyPot'}"
      @set 'message', 'Dealer Wins Sucka!!'
    else if dealerScore < playerScore
      @set 'moneyPot', ((@get 'moneyPot') + (@get 'currentBet'))
      console.log "New Pot is #{@get 'moneyPot'}"
      @set 'message', 'You Win for now!'
    else
      @set 'message', 'Keep the money, you filthy animal'
      console.log "New Pot is #{@get 'moneyPot'}"
    return

