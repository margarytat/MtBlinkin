
-- led logs
select a.name as 'worker', a.id, ll.led_state as 'state', ll.led_state_ack as 'l ack', ll.led_state_complete as 'l comp' 
	, ll.led_state_action as 'led action', ll.created_at as 'led_time', ll.id as 'l event id'
	from alert_alerts a 
		join alert_leds l on l.id = a.id 
		join alert_led_led_state_logs ll on ll.led_id = l.id
	where a.id = 5
	order by ll.id desc

-- button logs
select a.name as 'worker', a.id, bl.safe as 'b safe', bl.safe_ack as 'b ack', bl.safe_complete as 'b comp'
	, bl.safe_action as 'safe action', bl.created_at as 'b time', bl.id as 'b event id'
	from alert_button_safe_logs bl
		join alert_alerts a on a.id = bl.button_id
	--where a.id = 5
order by bl.id desc

select * from alert_button_safe_logs 
order by alert_button_safe_logs.id desc 

select * from alert_buttons

