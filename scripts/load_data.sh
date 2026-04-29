#!/bin/bash

BASE_TRANSACTION_ID=6617749242756
BASE_LOYALTY_ID=94960341489
BASE_PROMO_SET_ID="642898fcce3645449a4e7944c9A7"

for i in $(seq 1 10); do
  TRANSACTION_ID=$((BASE_TRANSACTION_ID + i))
  LOYALTY_ID=$((BASE_LOYALTY_ID + i))
  PROMO_SET_ID="${BASE_PROMO_SET_ID}${i}"

  echo "Sending record $i: transactionId=$TRANSACTION_ID, loyaltyId=$LOYALTY_ID, promoSetId=$PROMO_SET_ID"

  curl -s -o /dev/null -w "HTTP %{http_code}\n" \
    -X POST http://localhost:8082/topics/bbw_eai.hub.transaction.realtime.topic \
    -H "Content-Type: application/vnd.kafka.json.v2+json" \
    -d "{
      \"records\": [
        {
          \"value\": {
            \"Line\": [
              {
                \"quantity\": 1,
                \"ticketPrice\": 9.95,
                \"actualPrice\": 17.71,
                \"isGiftCard\": false,
                \"description\": \"Dogwood Flower Gentle & Clean Foaming Hand Soap Holder\",
                \"discountAmount\": 0,
                \"lineSequence\": 1,
                \"transactionId\": \"$TRANSACTION_ID\",
                \"article\": \"26091589\",
                \"isBOPIS\": false,
                \"originalTransactionId\": \"$TRANSACTION_ID\",
                \"lastUpdatedTS\": \"1743384678421\",
                \"taxAmount\": 2.78,
                \"status\": \"Invoiced\"
              }
            ],
            \"Transaction\": {
              \"loyaltyId\": \"$LOYALTY_ID\",
              \"storeNumber\": \"83020\",
              \"actualTimestampUTC\": \"1743384678421\",
              \"taxTotal\": 3.34,
              \"channelType\": \"Web\",
              \"transactionTS\": \"1743384678421\",
              \"subTotal\": 9.95,
              \"transactionId\": \"$TRANSACTION_ID\",
              \"transactionType\": \"Sale\",
              \"businessDate\": \"1773269137000\",
              \"total\": 29.26,
              \"discountTotal\": 0,
              \"offsetTimezone\": \"GMT-00:00\",
              \"countryCode\": \"US\",
              \"lastUpdatedTS\": \"1743384678421\",
              \"registerNumber\": \"000\",
              \"brand\": \"BBW\",
              \"currencyCode\": \"USD\",
              \"cid\": \"99a44f45-fa6c-4830-8655-29d9fcdf06e7\"
            },
            \"Promo\": [
              {
                \"promoSetId\": \"$PROMO_SET_ID\",
                \"promoSequence\": 1,
                \"promoDesc\": \"50%OffSoap\",
                \"couponId\": \"50%OffSoap\",
                \"lineSequence\": 1,
                \"transactionId\": \"$TRANSACTION_ID\"
              }
            ]
          }
        }
      ]
    }"

  echo ""
done
