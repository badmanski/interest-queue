amqp = require 'amqp'
yaml = require 'js-yaml'
fs = require 'fs'
secrets = yaml.safeLoad fs.readFileSync('./secrets.yml')
Loan = require './loan'

connection = amqp.createConnection
  host: secrets.mq.host
  login: secrets.mq.login
  password: secrets.mq.password

connection.on 'ready', ->
  connection.queue secrets.mq.sourceQueue, (q) ->
    q.subscribe (message) ->
      loan = new Loan
        amount: message.sum
        duration: message.days

      calculatedLoan =
        sum: loan.amount
        days: loan.duration
        interest: loan.totalInterest()
        totalSum: loan.totalAmount()
        token: secrets.mq.token

      console.log calculatedLoan
      if loan.isValid()
        connection.publish secrets.mq.destinationQueue, calculatedLoan
