local version = "0.1.0"
-- Events

-- Greetings
script.on_event(defines.events.on_tick, function(event)
    if event.tick == 300 then
        game.print({"custom-locale.playing_version", "[img=virtual-signal.signal-info]", version})
    end
end)