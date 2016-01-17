class Loan
  constructor: (opts = {}) ->
    @amount = opts.amount
    @duration = opts.duration

  interestPerDay: ->
    interestAmounts = []
    for day in [1..@duration]
      interestAmounts.push @amount * @interestForDay(day)

    interestAmounts

  interestForDay: (day) ->
    switch
      when day % 3 == 0 and day % 5 == 0 then 0.03
      when day % 3 == 0 then 0.01
      when day % 5 == 0 then 0.02
      else 0.04

  totalInterest: ->
    @interestPerDay().reduce (t, s) -> t + s

  totalAmount: -> @amount + @totalInterest()

module.exports = Loan
