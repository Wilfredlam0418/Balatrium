SMODS.Atlas {
	key = "modicon",
	path = "modicon.png",
	px = 34,
	py = 34
}

SMODS.Atlas {
	key = "element",
	path = "elementcards.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "acid",
	path = "acidcards.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "joker",
	path = "jokers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "acidjokers",
	path = "acidjokers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "booster",
	path = "pack.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "other",
	path = "othercards.png",
	px = 71,
	py = 95
}

SMODS.ConsumableType {
	key = "Element",
	primary_colour = HEX("306060"),
	secondary_colour = HEX("60c0c0"),
	loc_txt = {},
	default = "c_bium_hydrogen",
	collection_rows = {4, 4}
}

SMODS.UndiscoveredSprite {
	key = "Element",
	atlas = "other",
	pos = {x = 0, y = 0}
}

SMODS.ConsumableType {
	key = "Acid",
	primary_colour = HEX("657442"),
	secondary_colour = HEX("c9e743"),
	loc_txt = {},
	default = "c_bium_hf",
	collection_rows = {4, 4}
}

SMODS.UndiscoveredSprite {
	key = "Acid",
	atlas = "other",
	pos = {x = 3, y = 0}
}

SMODS.Consumable {
	set = "Element",
	key = "hydrogen",
	config = {suit_conv = "Spades", max_highlighted = 1e100},
	atlas = "element",
	pos = {x = 0, y = 0},
	loc_vars = function(self)
		return {
			vars = {
				self.config.max_highighted,
				localize(self.config.suit_conv, "suits_plural"),
				colours = {G.C.SUITS[self.config.suit_conv]}
			}
		}
	end
}

if next(SMODS.find_mod("SixSuits")) then
	local isotope = function(self, card, badges)
		badges[#badges + 1] = create_badge(localize("k_isotope"), get_type_colour(self or card.config, card), nil, 1.2)
	end
	SMODS.Consumable {
		set = "Element",
		key = "deuterium",
		set_card_type_badge = isotope,
		config = {suit_conv = "six_Stars", max_highlighted = 1e100},
		atlas = "other",
		pos = {x = 0, y = 2},
		loc_vars = function(self)
			return {
				vars = {
					self.config.max_highighted,
					localize(self.config.suit_conv, "suits_plural"),
					colours = {G.C.SUITS[self.config.suit_conv]}
				}
			}
		end
	}
	
	SMODS.Consumable {
		set = "Element",
		key = "tritium",
		set_card_type_badge = isotope,
		config = {suit_conv = "six_Moons", max_highlighted = 1e100},
		atlas = "other",
		pos = {x = 1, y = 2},
		loc_vars = function(self)
			return {
				vars = {
					self.config.max_highighted,
					localize(self.config.suit_conv, "suits_plural"),
					colours = {G.C.SUITS[self.config.suit_conv]}
				}
			}
		end
	}
end

SMODS.Consumable {
	set = "Element",
	key = "helium",
	config = {max_highlighted = 2},
	atlas = "element",
	pos = {x = 18, y = 0},
	loc_vars = function(self)
		return {vars = {self.config.max_highlighted}}
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			if highlighted ~= card then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						highlighted:juice_up(0.3, 0.5)
						return true
					end,
				}))
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.1,
					func = function()
						if highlighted then
							highlighted:set_edition({foil=true})
						end
						return true
					end,
				}))
				delay(0.5)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						G.hand:unhighlight_all()
						return true
					end,
				}))
			end
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "lithium",
	config = {joker = "j_bium_battery"},
	atlas = "element",
	pos = {x = 0, y = 1},
	loc_vars = function()
		return {}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		SMODS.add_card({key = self.config.joker})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "beryllium",
	config = {extra = {money = 10}},
	atlas = "element",
	pos = {x = 1, y = 1},
	loc_vars = function(self)
		return {vars = {self.config.extra.money}}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		G.GAME.dollars = G.GAME.dollars + self.config.extra.money
	end
}

SMODS.Consumable {
	set = "Element",
	key = "boron",
	config = {ante_decrease = 1},
	atlas = "element",
	pos = {x = 13, y = 1},
	loc_vars = function(self)
		return {vars = {self.config.ante_decrease}}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		ease_ante(-self.config.ante_decrease)
	end
}

SMODS.Consumable {
	set = "Element",
	key = "carbon",
	config = {suit_conv = "Diamonds", max_highlighted = 1e100},
	atlas = "element",
	pos = {x = 14, y = 1},
	loc_vars = function(self)
		return {
			vars = {
				self.config.max_highighted,
				localize(self.config.suit_conv, "suits_plural"),
				colours = {G.C.SUITS[self.config.suit_conv]}
			}
		}
	end
}

SMODS.Consumable {
	set = "Element",
	key = "nitrogen",
	config = {suit_conv = "Hearts", max_highlighted = 1e100},
	atlas = "element",
	pos = {x = 15, y = 1},
	loc_vars = function(self)
		return {
			vars = {
				self.config.max_highighted,
				localize(self.config.suit_conv, "suits_plural"),
				colours = {G.C.SUITS[self.config.suit_conv]}
			}
		}
	end
}

SMODS.Consumable {
	set = "Element",
	key = "oxygen",
	config = {suit_conv = "Clubs", max_highlighted = 1e100},
	atlas = "element",
	pos = {x = 16, y = 1},
	loc_vars = function(self)
		return {
			vars = {
				self.config.max_highighted,
				localize(self.config.suit_conv, "suits_plural"),
				colours = {G.C.SUITS[self.config.suit_conv]}
			}
		}
	end
}

SMODS.Consumable {
	set = "Element",
	key = "fluorine",
	config = {type = "Acid"},
	atlas = "element",
	pos = {x = 17, y = 1},
	loc_vars = function(self)
		return {vars = {self.config.type, colours = {G.C.SECONDARY_SET[self.config.type]}}}
	end,
	can_use = function(self)
		return true
	end,
	use = function(self)
		local card = create_card(self.config.type, G.consumeables, nil, nil, true, true, nil, "bium_g17")
		card:add_to_deck()
		G.consumeables:emplace(card)
	end
}

SMODS.Consumable {
	set = "Element",
	key = "neon",
	config = {max_highlighted = 2},
	atlas = "element",
	pos = {x = 18, y = 1},
	loc_vars = function(self)
		return {vars = {self.config.max_highlighted}}
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			if highlighted ~= card then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						highlighted:juice_up(0.3, 0.5)
						return true
					end,
				}))
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.1,
					func = function()
						if highlighted then
							highlighted:set_edition({holo=true})
						end
						return true
					end,
				}))
				delay(0.5)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						G.hand:unhighlight_all()
						return true
					end,
				}))
			end
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "sodium",
	config = {joker = "j_bium_salt_cube"},
	atlas = "element",
	pos = {x = 0, y = 2},
	loc_vars = function()
		return {}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		SMODS.add_card({key = self.config.joker})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "magnesium",
	config = {extra = {Xmoney = 1.5}},
	atlas = "element",
	pos = {x = 1, y = 2},
	loc_vars = function(self)
		return {vars = {self.config.extra.Xmoney}}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		G.GAME.dollars = G.GAME.dollars * self.config.extra.Xmoney
	end
}

SMODS.Consumable {
	set = "Element",
	key = "aluminum",
	config = {ante_decrease = 1, discards = 1},
	atlas = "element",
	pos = {x = 13, y = 2},
	loc_vars = function(self)
		return {vars = {self.config.ante_decrease, self.config.discards}}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		ease_ante(-self.config.ante_decrease)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + self.config.discards
	end
}

SMODS.Consumable {
	set = "Element",
	key = "silicon",
	config = {amount = 3, type = "Tarot"},
	atlas = "element",
	pos = {x = 14, y = 2},
	loc_vars = function(self)
		return {
			vars = {
				self.config.amount,
				self.config.type,
				colours = {G.C.SECONDARY_SET[self.config.type]}
			}
		}
	end,
	can_use = function(self)
		return true
	end,
	use = function(self)
		for i=1, self.config.amount, 1 do
			local card = create_card(self.config.type, G.consumeables, nil, nil, true, true)
			card:add_to_deck()
			G.consumeables:emplace(card)
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "phosphorus",
	config = {amount = 2, type = "Joker"},
	atlas = "element",
	pos = {x = 15, y = 2},
	loc_vars = function(self)
		return {
			vars = {
				self.config.amount,
				self.config.type,
				colours = {G.C.SECONDARY_SET[self.config.type]}
			}
		}
	end,
	can_use = function(self)
		return true
	end,
	use = function(self)
		for i=1, self.config.amount, 1 do
			local card = create_card(self.config.type, G.jokers, nil, nil, true, true)
			card:add_to_deck()
			G.jokers:emplace(card)
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "sulfur",
	config = {},
	atlas = "element",
	pos = {x = 16, y = 2},
	loc_vars = function(self)
		return {vars = {colours = {G.C.SECONDARY_SET.VOUCHER}}}
	end,
	can_use = function(self)
		return true
	end,
	use = function(self)
		local temp = G.GAME.current_round.voucher
		local card = create_card("Voucher", G.redeemed_vouchers_during_hand, nil, nil, true, true)
		card:start_materialize()
		card.cost = 0
		card.shop_voucher = false
		card:redeem()
		G.GAME.current_round.voucher = temp
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0,
			func = function()
				card:start_dissolve()
				return true
			end,
		}))
	end
}

SMODS.Consumable {
	set = "Element",
	key = "chlorine",
	config = {extra = {acidity = 2}},
	atlas = "element",
	pos = {x = 17, y = 2},
	loc_vars = function(self)
		return {vars = {self.config.extra.acidity}}
	end,
	can_use = function(self)
		return true
	end,
	use = function(self)
		for i=1, #G.consumeables.cards, 1 do
			if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
				G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.extra.acidity
			end
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "argon",
	config = {max_highlighted = 2},
	atlas = "element",
	pos = {x = 18, y = 2},
	loc_vars = function(self)
		return {vars = {self.config.max_highlighted}}
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			if highlighted ~= card then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						highlighted:juice_up(0.3, 0.5)
						return true
					end,
				}))
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.1,
					func = function()
						if highlighted then
							highlighted:set_edition({polychrome=true})
						end
						return true
					end,
				}))
				delay(0.5)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						G.hand:unhighlight_all()
						return true
					end,
				}))
			end
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "potassium",
	config = {joker = "j_gros_michel"},
	atlas = "element",
	pos = {x = 0, y = 3},
	loc_vars = function()
		return {}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		SMODS.add_card({key = self.config.joker})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "calcium",
	config = {extra = {money = 5, Xmoney = 1.25}},
	atlas = "element",
	pos = {x = 1, y = 3},
	loc_vars = function(self)
		return {vars = {self.config.extra.money, self.config.extra.Xmoney}}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		G.GAME.dollars = G.GAME.dollars + self.config.extra.money
		G.GAME.dollars = G.GAME.dollars * self.config.extra.Xmoney
	end
}

SMODS.Consumable {
	set = "Spectral",
	key = "balatrium",
	config = {type = "Element"},
	atlas = "other",
	hidden = true,
	soul_set = "Element",
	pos = {x = 1, y = 0},
	soul_pos = {x = 2, y = 0},
	loc_vars = function(self)
		return {
			vars = {
				self.config.type,
				colours = {G.C.SECONDARY_SET[self.config.type]}
			}
		}
	end,
	can_use = function()
		return true
	end,
	use = function(self)
		for i=1, #G.P_CENTER_POOLS[self.config.type], 1 do
			if G.P_CENTER_POOLS[self.config.type][i]["key"] ~= "c_bium_balatrium" and G.P_CENTER_POOLS[self.config.type][i]["key"] ~= "c_cry_pointer" and G.P_CENTER_POOLS[self.config.type][i]["discovered"] then
				SMODS.add_card({key = G.P_CENTER_POOLS[self.config.type][i]["key"], edition = "e_negative"})
			end
		end
	end
}

SMODS.Consumable {
	set = "Acid",
	key = "hf",
	config = {acidity = 0},
	pos = {x = 0, y = 0},
	atlas = "acid",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.acidity}}
	end,
	can_use = function(self, card)
		return card.ability.acidity > 4
	end,
	use = function(self)
		if self.config.acidity < 10 then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
		elseif self.config.acidity < 15 then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
		else
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
		end
	end
}

SMODS.Consumable {
	set = "Acid",
	key = "hcl",
	config = {acidity = 0},
	pos = {x = 1, y = 0},
	atlas = "acid",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.acidity}}
	end,
	can_use = function(self, card)
		return card.ability.acidity > 9
	end,
	use = function(self)
		if self.config.acidity < 20 then
			for i=1, #G.consumeables.cards, 1 do
				if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
					G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + 2
				end
			end
		elseif self.config.acidity < 30 then
			for i=1, #G.consumeables.cards, 1 do
				if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
					G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + 4
				end
			end
		else
			for i=1, #G.consumeables.cards, 1 do
				if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
					G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + 6
				end
			end
		end
	end
}

SMODS.Consumable {
	set = "Acid",
	key = "hbr",
	config = {acidity = 0},
	pos = {x = 2, y = 0},
	atlas = "acid",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.acidity}}
	end,
	can_use = function(self, card)
		return card.ability.acidity > 4
	end,
	use = function(self)
		if self.config.acidity < 15 then
			G.GAME.dollars = G.GAME.dollars + 10
		elseif self.config.acidity < 30 then
			G.GAME.dollars = G.GAME.dollars + 20
		else
			G.GAME.dollars = G.GAME.dollars + 30
		end
	end
}

local used_up = function(self, card, badges)
	badges[#badges + 1] = create_badge(localize("k_used_up"), get_type_colour(self or card.config, card), nil, 1.2)
end

SMODS.Joker {
	key = "battery",
	config = {type = "Tarot", extra = {amount = 3, amount_mod = 1}},
	pos = {x = 3, y = 0},
	rarity = 2,
	cost = 7,
	eternal_compat = false,
	atlas = "joker",
	pools = {["Food"] = true},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.type, card.ability.extra.amount, card.ability.extra.amount_mod, colours = {G.C.SECONDARY_SET[card.ability.type]}}}
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			for i=1, card.ability.extra.amount, 1 do
				local card = create_card(card.ability.type, G.consumeables, nil, nil, true, true, nil, "bium_battery")
				card:add_to_deck()
				G.consumeables:emplace(card)
			end
			card.ability.extra.amount = card.ability.extra.amount - card.ability.extra.amount_mod
			if card.ability.extra.amount <= 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = used_up,
					colour = G.C.FILTER
				}
			end
		end
	end
}

SMODS.Joker {
	key = "salt_cube",
	config = {extra = {money = 5, money_mod = 1}},
	pos = {x = 0, y = 0},
	rarity = 1,
	cost = 4,
	eternal_compat = false,
	atlas = "joker",
	pools = {["Food"] = true},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.money, card.ability.extra.money_mod}}
	end,
	calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.money
		if bonus > 0 then return bonus end
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.money = card.ability.extra.money - card.ability.extra.money_mod
			if card.ability.extra.money <= 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_eaten_ex"),
					colour = G.C.FILTER
				}
			end
		end
	end
}

SMODS.Joker {
	key = "proton",
	config = {extra = {mult = 2}},
	pos = {x = 1, y = 1},
	rarity = 1,
	cost = 4,
	atlas = "joker",
	loc_vars = function(self)
		return {vars = {self.config.extra.mult}}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return {message = localize({type = "variable", key = "a_mult", vars = {card.ability.extra.mult}}), mult_mod = card.ability.extra.mult}
		end
	end
}

SMODS.Joker {
	key = "neutron",
	config = {extra = {xmult = 1.2}},
	pos = {x = 2, y = 1},
	rarity = 2,
	cost = 6,
	atlas = "joker",
	loc_vars = function(self)
		return {vars = {self.config.extra.xmult}}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return {message = localize({type = "variable", key = "a_xmult", vars = {card.ability.extra.xmult}}), mult_mod = card.ability.extra.xmult}
		end
	end
}

SMODS.Joker {
	key = "electron",
	config = {extra = {chips = 15}},
	pos = {x = 3, y = 1},
	rarity = 1,
	cost = 4,
	atlas = "joker",
	loc_vars = function(self)
		return {vars = {self.config.extra.chips}}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return {message = localize({type = "variable", key = "a_chips", vars = {card.ability.extra.chips}}), chip_mod = card.ability.extra.chips}
		end
	end
}

local acidity_increase = function(self, card, badges)
	badges[#badges + 1] = create_badge(localize("k_acidity_increase"), get_type_colour(self or card.config, card), nil, 1.2)
end

SMODS.Joker {
	key = "exuberant",
	config = {acidity = 1, type = "Pair"},
	pos = { x = 0, y = 0 },
	rarity = 1,
	cost = 4,
	atlas = "acidjokers",
	loc_vars = function(self)
		return {vars = {self.config.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
				for i=1, #G.consumeables.cards, 1 do
					if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
						G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

SMODS.Joker {
	key = "exultant",
	config = {acidity = 1.5, type = "Three of a Kind"},
	pos = { x = 1, y = 0 },
	rarity = 1,
	cost = 4,
	atlas = "acidjokers",
	loc_vars = function(self)
		return {vars = {self.config.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
				for i=1, #G.consumeables.cards, 1 do
					if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
						G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

SMODS.Joker {
	key = "rapturous",
	config = {acidity = 1.5, type = "Two Pair"},
	pos = { x = 2, y = 0 },
	rarity = 1,
	cost = 4,
	atlas = "acidjokers",
	loc_vars = function(self)
		return {vars = {self.config.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
				for i=1, #G.consumeables.cards, 1 do
					if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
						G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

SMODS.Joker {
	key = "blithe",
	config = {acidity = 1.5, type = "Straight"},
	pos = { x = 3, y = 0 },
	rarity = 1,
	cost = 4,
	atlas = "acidjokers",
	loc_vars = function(self)
		return {vars = {self.config.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
				for i=1, #G.consumeables.cards, 1 do
					if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
						G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

SMODS.Joker {
	key = "ecstatic",
	config = {acidity = 1, type = "Flush"},
	pos = { x = 4, y = 0 },
	rarity = 1,
	cost = 4,
	atlas = "acidjokers",
	loc_vars = function(self)
		return {vars = {self.config.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
				for i=1, #G.consumeables.cards, 1 do
					if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
						G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

function numbers_to_word(numbers)
	numbers_to_word_letters = "abcdefghijklmnopqrstuvwxyz"
	numbers_to_word_string = ""
	for i=1, #numbers, 1 do
		numbers_to_word_string = numbers_to_word_string .. numbers_to_word_letters.sub(numbers_to_word_letters, numbers[i], numbers[i])
	end
	return numbers_to_word_string
end

if next(SMODS.find_mod("Cryptid")) then
	SMODS.Joker {
		key = "thrilled",
		config = {acidity = 0.5, type = "High Card"},
		pos = { x = 0, y = 1 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end
	}

	SMODS.Joker {
		key = "enlivened",
		config = {acidity = 2, type = "Four of a Kind"},
		pos = { x = 1, y = 1 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end
	}

	SMODS.Joker {
		key = "enthusiastic",
		config = {acidity = 2.5, type = "Straight Flush"},
		pos = { x = 2, y = 1 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end
	}

	SMODS.Joker {
		key = "delighted",
		config = {acidity = 2, type = "Full House"},
		pos = { x = 3, y = 1 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end
	}

	SMODS.Joker {
		key = "adrenalized",
		config = {acidity = 2.5, type = "Five of a Kind"},
		pos = { x = 4, y = 1 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands[self.config.type].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "astonishing",
		config = {acidity = 4.5, type = "Flush House"},
		pos = { x = 0, y = 2 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands[self.config.type].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "staggering",
		config = {acidity = 4.5, type = "Flush Five"},
		pos = { x = 1, y = 2 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands[self.config.type].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "extraordinary",
		config = {acidity = 2.5, type = "cry_Bulwark"},
		pos = { x = 2, y = 2 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands[self.config.type].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "perplexing",
		config = {acidity = 5, type = "cry_Cluster" .. numbers_to_word({6, 21, 3, 11})},
		pos = { x = 3, y = 2 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands[self.config.type].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "spectacular",
		config = {acidity = 6, type = "cry_UltPair"},
		pos = { x = 4, y = 2 },
		rarity = 1,
		cost = 4,
		atlas = "acidjokers",
		loc_vars = function(self)
			return {vars = {self.config.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main then
				if context.poker_hands ~= nil and (next(context.poker_hands[self.config.type])) then
					for i=1, #G.consumeables.cards, 1 do
						if G.consumeables.cards[i]["ability"]["set"] == "Acid" then
							G.consumeables.cards[i]["ability"]["acidity"] = G.consumeables.cards[i]["ability"]["acidity"] + self.config.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands[self.config.type].played > 0 then
				return true
			end
			return false
		end
	}
end

SMODS.Booster {
	key = "atomic_normal_1",
	kind = "Element",
	cost = 4,
	config = {extra = 2, choose = 1},
	group_key = "k_bium_atomic_pack",
	draw_hand = true,
	create_card = function(self, card)
		local card = create_card("Element", G.pack_cards, nil, nil, true, true, nil, "bium_element")
		return card
	end,
	pos = {x = 0, y = 0},
	weight = 1,
	atlas = "booster",
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Element)
		ease_background_colour({new_colour = G.C.SET.Element, special_colour = G.C.BLACK, contrast = 2})
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
}

SMODS.Booster {
	key = "atomic_normal_2",
	kind = "Element",
	cost = 4,
	config = {extra = 2, choose = 1},
	group_key = "k_bium_atomic_pack",
	draw_hand = true,
	create_card = function(self, card)
		local card = create_card("Element", G.pack_cards, nil, nil, true, true, nil, "bium_element")
		return card
	end,
	pos = {x = 1, y = 0},
	weight = 1,
	atlas = "booster",
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Element)
		ease_background_colour({new_colour = G.C.SET.Element, special_colour = G.C.BLACK, contrast = 2})
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
}

SMODS.Booster {
	key = "atomic_jumbo_1",
	kind = "Element",
	cost = 6,
	config = {extra = 4, choose = 1},
	group_key = "k_bium_atomic_pack",
	draw_hand = true,
	create_card = function(self, card)
		local card = create_card("Element", G.pack_cards, nil, nil, true, true, nil, "bium_element")
		return card
	end,
	pos = {x = 2, y = 0},
	weight = 1,
	atlas = "booster",
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Element)
		ease_background_colour({new_colour = G.C.SET.Element, special_colour = G.C.BLACK, contrast = 2})
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
}

SMODS.Booster {
	key = "atomic_mega_1",
	kind = "Element",
	cost = 4,
	config = {extra = 4, choose = 2},
	group_key = "k_bium_atomic_pack",
	draw_hand = true,
	create_card = function(self, card)
		local card = create_card("Element", G.pack_cards, nil, nil, true, true, nil, "bium_element")
		return card
	end,
	pos = {x = 3, y = 0},
	weight = 0.25,
	atlas = "booster",
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Element)
		ease_background_colour({new_colour = G.C.SET.Element, special_colour = G.C.BLACK, contrast = 2})
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end
}
