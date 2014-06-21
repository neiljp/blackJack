class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    # window.alert 'Player has hit'
    @add(@deck.pop()).last()
    someScore = do @scores
    if someScore[0] > 21 then @trigger 'gameOver'

  stand: ->
    if @.isDealer
      @.models[0].flip()
      while @.scores()[0] < 17
        @.hit()
        #console.log @.scores()
      @.trigger 'gameOver'


  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    # hasAce = @reduce (memo, card) ->
    #   memo or card.get('value') is 1
    # , false
    aceCount = @reduce (numAces, card) ->
      if card.get('value') is 1 then numAces++
      numAces
    , 0

    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    score += aceCount*10

    while aceCount and score > 21
      score -= 10
      aceCount--

    [score]
