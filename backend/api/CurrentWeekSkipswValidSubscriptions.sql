SELECT *

FROM Orders

LEFT JOIN Customers

ON Orders.Phone_Number = Customers.ship_phone_number

WHERE Delivery_Time = "SKIP DELIVERY"
	AND subscription_status <> "cancelled" AND subscription_status <> "none"