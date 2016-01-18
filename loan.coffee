class Loan
  constructor: (opts = {}) ->
    @amount = opts.amount
    @duration = opts.duration

  interestPerDay: ->
    interestAmounts = []
    for day in [1..@duration]
      interestAmount = Math.round(@amount * @interestForDay(day) * 100) / 100
      interestAmounts.push interestAmount

    interestAmounts

  interestForDay: (day) ->
    switch
      when day % 3 == 0 and day % 5 == 0 then 0.03
      when day % 3 == 0 then 0.01
      when day % 5 == 0 then 0.02
      else 0.04

  totalInterest: ->
    Math.round((@interestPerDay().reduce (t, s) -> t + s) * 100) / 100

  totalAmount: -> @amount + @totalInterest()

module.exports = Loan
