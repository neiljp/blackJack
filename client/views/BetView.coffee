class window.BetView extends Backbone.View
  className: 'bet'

  template: _.template '<table class="pot">
                          <caption>Your pot:<%=@get "moneyPot" %>$</caption>
                          <tr>
                            <th><img class="chip" id="5" src="img/chips/5.png"></th>
                            <th><img class="chip" id="25" src="img/chips/25.png"></th>
                            <th><img class="chip" id="50" src="img/chips/50.png"></th>
                          </tr>
                          <tr id="5">
                            <td class="tdchip" id="1"  bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2"></td>
                            <td class="tdchip" id="3"></td>
                          </tr>
                          <tr id="4">
                            <td class="tdchip" id="1"  bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2"></td>
                            <td class="tdchip" id="3"></td>
                          </tr>
                          <tr id="3">
                            <td class="tdchip" id="1"  bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2"></td>
                            <td class="tdchip" id="3"  bgcolor="#0E1C55"></td>
                          </tr>
                          <tr id="2">
                            <td class="tdchip" id="1"  bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2"  bgcolor="#FF0000"></td>
                            <td class="tdchip" id="3"  bgcolor="#0E1C55"></td>
                          </tr>
                          <tr id="1">
                            <td class="tdchip" id="1" bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2" bgcolor="#FF0000"></td>
                            <td class="tdchip" id="3" bgcolor="#0E1C55"></td>
                          </tr>
                        </table>
                        <table class="currentbet">
                          <caption>Your current bet: <%=@model.get("currentBet") %>$</caption>
                          <tr></tr>
                          <tr id="5">
                            <td class="tdchip" id="1"  bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2"></td>
                            <td class="tdchip" id="3"></td>
                          </tr>
                          <tr id="4">
                            <td class="tdchip" id="1"  bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2"></td>
                            <td class="tdchip" id="3"></td>
                          </tr>
                          <tr id="3">
                            <td class="tdchip" id="1"  bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2"></td>
                            <td class="tdchip" id="3"  bgcolor="#0E1C55"></td>
                          </tr>
                          <tr id="2">
                            <td class="tdchip" id="1"  bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2"  bgcolor="#FF0000"></td>
                            <td class="tdchip" id="3"  bgcolor="#0E1C55"></td>
                          </tr>
                          <tr id="1">
                            <td class="tdchip" id="1" bgcolor="#FFFFFF"></td>
                            <td class="tdchip" id="2" bgcolor="#FF0000"></td>
                            <td class="tdchip" id="3" bgcolor="#0E1C55"></td>
                          </tr>
                        </table>
                        '

  initialize: ->
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template
