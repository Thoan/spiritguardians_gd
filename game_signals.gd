extends Node

signal battle_ticked # signal to update all cooldowns and progress bars
signal battle_started # signal to start the battle
signal battle_ended # signal to end the battle

signal spirit_attacked(reference) # signal to all abilities to charge up and/or trigger
signal spirit_died # signal to end battle
signal ability_triggered(ability_trigger_configs: Dictionary) # signal to execute ability

# Sandbox signals
signal sandbox_triggered(ref)