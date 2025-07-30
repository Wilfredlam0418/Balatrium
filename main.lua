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
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				localize(card.ability.suit_conv, "suits_plural"),
				colours = {G.C.SUITS[card.ability.suit_conv]}
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
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					localize(card.ability.suit_conv, "suits_plural"),
					colours = {G.C.SUITS[card.ability.suit_conv]}
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
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					localize(card.ability.suit_conv, "suits_plural"),
					colours = {G.C.SUITS[card.ability.suit_conv]}
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
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	use = function(self, card)
		for i, j in ipairs(G.hand.highlighted) do
			j:set_edition({foil=true})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "lithium",
	config = {extra = {joker = "j_bium_battery"}},
	atlas = "element",
	pos = {x = 0, y = 1},
	loc_vars = function(self, info_queue, card)
		return {vars = {localize({key = card.ability.extra.joker, set = "Joker", type = "name_text"})}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		SMODS.add_card({key = card.ability.extra.joker})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "beryllium",
	config = {extra = {money = 10}},
	atlas = "element",
	pos = {x = 1, y = 1},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.money}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		ease_dollars(card.ability.extra.money)
	end
}

SMODS.Consumable {
	set = "Element",
	key = "boron",
	config = {extra = {ante_decrease = 1}},
	atlas = "element",
	pos = {x = 13, y = 1},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.ante_decrease}}
	end,
	can_use = function() return true end,
	use = function(self)
		ease_ante(-card.ability.extra.ante_decrease)
	end
}

SMODS.Consumable {
	set = "Element",
	key = "carbon",
	config = {suit_conv = "Diamonds", max_highlighted = 1e100},
	atlas = "element",
	pos = {x = 14, y = 1},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				localize(card.ability.suit_conv, "suits_plural"),
				colours = {G.C.SUITS[card.ability.suit_conv]}
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
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				localize(card.ability.suit_conv, "suits_plural"),
				colours = {G.C.SUITS[card.ability.suit_conv]}
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
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				localize(card.ability.suit_conv, "suits_plural"),
				colours = {G.C.SUITS[card.ability.suit_conv]}
			}
		}
	end
}

SMODS.Consumable {
	set = "Element",
	key = "fluorine",
	config = {extra = {type = "Acid"}},
	atlas = "element",
	pos = {x = 17, y = 1},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.type, colours = {G.C.SECONDARY_SET[card.ability.extra.type]}}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		SMODS.add_card({set = card.ability.extra.type})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "neon",
	config = {max_highlighted = 2},
	atlas = "element",
	pos = {x = 18, y = 1},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	can_use = function() return true end,
	use = function(self, card, area, copier)
		for i, j in ipairs(G.hand.highlighted) do
			j:set_edition({holo=true})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "sodium",
	config = {extra = {joker = "j_bium_salt_cube"}},
	atlas = "element",
	pos = {x = 0, y = 2},
	loc_vars = function()
		return {vars = {localize({key = card.ability.extra.joker, set = "Joker", type = "name_text"})}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		SMODS.add_card({key = card.ability.extra.joker})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "magnesium",
	config = {extra = {Xmoney = 1.5}},
	atlas = "element",
	pos = {x = 1, y = 2},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.Xmoney}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		G.GAME.dollars = G.GAME.dollars * card.ability.extra.Xmoney
	end
}

SMODS.Consumable {
	set = "Element",
	key = "aluminum",
	config = {extra = {ante_decrease = 1, discards = 1}},
	atlas = "element",
	pos = {x = 13, y = 2},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.ante_decrease, card.ability.extra.discards}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		ease_ante(-card.ability.extra.ante_decrease)
		ease_discard(card.ability.extra.discards)
	end
}

SMODS.Consumable {
	set = "Element",
	key = "silicon",
	config = {extra = {amount = 3, type = "Tarot"}},
	atlas = "element",
	pos = {x = 14, y = 2},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.amount,
				card.ability.extra.type,
				colours = {G.C.SECONDARY_SET[card.ability.extra.type]}
			}
		}
	end,
	can_use = function() return true end,
	use = function(self, card)
		for i=1, card.ability.extra.amount do
			SMODS.add_card({set = card.ability.extra.type})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "phosphorus",
	config = {extra = {amount = 2, type = "Joker"}},
	atlas = "element",
	pos = {x = 15, y = 2},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.amount,
				card.ability.extra.type,
				colours = {G.C.SECONDARY_SET[card.ability.extra.type]}
			}
		}
	end,
	can_use = function() return true end,
	use = function(self, card)
		for i=1, card.ability.amount do
			SMODS.add_card({set = card.ability.extra.type})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "sulfur",
	atlas = "element",
	pos = {x = 16, y = 2},
	loc_vars = function()
		return {vars = {colours = {G.C.SECONDARY_SET.VOUCHER}}}
	end,
	can_use = function() return true end,
	use = function()
		local temp = G.GAME.current_round.voucher
		local card = create_card("Voucher", G.redeemed_vouchers_during_hand, nil, nil, true, true)
		card:start_materialize()
		card.cost = 0
		card.shop_voucher = false
		card:redeem()
		G.GAME.current_round.voucher = temp
		card:start_dissolve()
	end
}

SMODS.Consumable {
	set = "Element",
	key = "chlorine",
	config = {extra = {acidity = 2}},
	atlas = "element",
	pos = {x = 17, y = 2},
	loc_vars = function(self, info_queue, card)
		return {vars = {self.config.extra.acidity}}
	end,
	can_use = function()
		return #G.consumeables > 0
	end,
	use = function(self, card)
		for i=1, #G.consumeables.cards do
			if G.consumeables.cards[i].ability.set == "Acid" then
				G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
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
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	use = function(self, card, area, copier)
		for i, j in ipairs(G.hand.highlighted) do
			j:set_edition({polychrome=true})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "potassium",
	config = {extra = {joker = "j_gros_michel"}},
	atlas = "element",
	pos = {x = 0, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {localize({key = card.ability.extra.joker, set = "Joker", type = "name_text"})}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		SMODS.add_card({key = card.ability.extra.joker})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "calcium",
	config = {extra = {money = 5, Xmoney = 1.25}},
	atlas = "element",
	pos = {x = 1, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.money, card.ability.extra.Xmoney}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		ease_dollars(card.ability.extra.money)
		G.GAME.dollars = G.GAME.dollars * card.ability.extra.Xmoney
	end
}

SMODS.Consumable {
	set = "Element",
	key = "scandium",
	config = {extra = {rarity = "Common"}},
	atlas = "element",
	pos = {x = 3, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.rarity, colours = {G.C.RARITY[self.config.rarity]}}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		for i=1,3 do
			SMODS.add_card({set = "Joker", rarity = card.ability.extra.rarity})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "titanium",
	config = {extra = {rarity = "Uncommon"}},
	atlas = "element",
	pos = {x = 4, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.rarity, colours = {G.C.RARITY[card.ability.extra.rarity]}}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		for i=1,3 do
			SMODS.add_card({set = "Joker", rarity = card.ability.extra.rarity})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "vanadium",
	config = {extra = {rarity = "Rare"}},
	atlas = "element",
	pos = {x = 5, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.rarity, colours = {G.C.RARITY[card.ability.extra.rarity]}}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		for i=1,2 do
			SMODS.add_card({set = "Joker", rarity = card.ability.extra.rarity})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "chromium",
	config = {extra = {rarity1 = "Legendary", rarity2 = "Uncommon"}},
	atlas = "element",
	pos = {x = 6, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.rarity1, card.ability.extra.rarity2, colours = {G.C.RARITY[card.ability.extra.rarity1], G.C.RARITY[card.ability.extra.rarity2]}}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		SMODS.add_card({set = "Joker", rarity = card.ability.extra.rarity1})
		SMODS.add_card({set = "Joker", rarity = card.ability.extra.rarity2})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "manganese",
	config = {extra = {rarity1 = "Legendary", rarity2 = "Rare"}},
	atlas = "element",
	pos = {x = 7, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.rarity1, card.ability.extra.rarity2, colours = {G.C.RARITY[card.ability.extra.rarity1], G.C.RARITY[card.ability.extra.rarity2]}}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		SMODS.add_card({set = "Joker", rarity = card.ability.extra.rarity1})
		SMODS.add_card({set = "Joker", rarity = card.ability.extra.rarity2})
	end
}

SMODS.Consumable {
	set = "Element",
	key = "iron",
	config = {},
	atlas = "element",
	pos = {x = 8, y = 3},
	can_use = function()
		for i=1, #G.jokers.cards do
			if G.jokers.cards[i].ability.eternal then
				return true
			end
		end
		return false
	end,
	use = function()
		for i=1, #G.jokers.cards, 1 do
			G.jokers.cards[i].ability.eternal = false
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "cobalt",
	config = {},
	atlas = "element",
	pos = {x = 9, y = 3},
	can_use = function()
		for i=1, #G.jokers.cards do
			if G.jokers.cards[i].ability.perishable then
				return true
			end
		end
		return false
	end,
	use = function()
		for i=1, #G.jokers.cards, 1 do
			G.jokers.cards[i].ability.perishable = false
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "nickel",
	config = {},
	atlas = "element",
	pos = {x = 10, y = 3},
	can_use = function()
		for i=1, #G.jokers.cards do
			if G.jokers.cards[i].ability.rental then
				return true
			end
		end
		return false
	end,
	use = function()
		for i=1, #G.jokers.cards, 1 do
			G.jokers.cards[i].ability.rental = false
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "copper",
	config = {max_highlighted = 3, extra = {seal = "bium_copper"}},
	atlas = "element",
	pos = {x = 11, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted, colours = {HEX("EB8170")}}}
	end,
	use = function(self, card, area, copier)
		for i=1, #G.hand.highlighted do
			G.hand.highlighted[i]:set_seal(card.ability.extra.seal, nil, true)
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "zinc",
	config = {extra = {cards = 2}},
	atlas = "element",
	pos = {x = 12, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.cards}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		SMODS.draw_cards(card.ability.extra.cards)
	end
}

SMODS.Consumable {
	set = "Element",
	key = "gallium",
	config = {extra = {ante_decrease = 1, hands = 1}},
	atlas = "element",
	pos = {x = 13, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.ante_decrease, card.ability.extra.hands}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		ease_ante(-card.ability.extra.ante_decrease)
		ease_hands_played(card.ability.extra.hands)
	end
}

SMODS.Consumable {
	set = "Element",
	key = "germanium",
	config = {extra = {amount = 3, type = "Planet"}},
	atlas = "element",
	pos = {x = 14, y = 3},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.amount,
				card.ability.extra.type,
				colours = {G.C.SECONDARY_SET[card.ability.extra.type]}
			}
		}
	end,
	can_use = function() return true end,
	use = function(self, card)
		for i=1, card.ability.extra.amount do
			SMODS.add_card({set = card.ability.extra.type})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "arsenic",
	config = {extra = {slots = 1}},
	atlas = "element",
	pos = {x = 15, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.slots}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
	end
}

SMODS.Consumable {
	set = "Element",
	key = "selenium",
	config = {extra = {slots = 1}},
	atlas = "element",
	pos = {x = 16, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.slots}}
	end,
	can_use = function() return true end,
	use = function(self, card)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slots
	end
}

SMODS.Consumable {
	set = "Element",
	key = "bromine",
	config = {extra = {xacidity = 1.25}},
	atlas = "element",
	pos = {x = 17, y = 2},
	loc_vars = function(self, info_queue, card)
		return {vars = {self.config.extra.acidity}}
	end,
	can_use = function()
		return #G.consumeables > 0
	end,
	use = function(self, card)
		for i=1, #G.consumeables.cards do
			if G.consumeables.cards[i].ability.set == "Acid" then
				G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity * card.ability.extra.xacidity
			end
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "krypton",
	config = {max_highlighted = 1},
	atlas = "element",
	pos = {x = 18, y = 3},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	can_use = function() return true end,
	use = function(self, card, area, copier)
		for i, j in ipairs(G.hand.highlighted) do
			j:set_edition({negative=true})
		end
	end
}

SMODS.Consumable {
	set = "Element",
	key = "nihonium",
	atlas = "element",
	hidden = true,
	pos = {x = 13, y = 6},
	can_use = function()
		return true
	end,
	use = function()
		local jokers = {}
		local joker_abilities = {}
		local joker_editions = {}
		for i=1, #G.jokers.cards do
			jokers[#jokers+1] = G.jokers.cards[i].config.center.key
			joker_abilities[#joker_abilities+1] = G.jokers.cards[i].ability
			joker_editions[#joker_editions+1] = G.jokers.cards[i].edition or 0
		end
		local consumables = {}
		local consumable_abilities = {}
		local consumable_editions = {}
		for i=1, #G.consumeables.cards do
			consumables[#consumables+1] = G.consumeables.cards[i].config.center.key
			consumable_abilities[#consumable_abilities+1] = G.consumeables.cards[i].ability
			consumable_editions[#consumable_editions+1] = G.consumeables.cards[i].edition or 0
		end
		G.jokers.cards = {}
		G.consumeables.cards = {}
		for i=1, #jokers do
			SMODS.add_card({key = jokers[i], area = G.consumeables})
			G.consumeables.cards[i].ability = joker_abilities[i]
			if joker_editions[i] == 0 then joker_editions[i] = nil end
			G.consumeables.cards[i].edition = joker_editions[i]
		end
		for i=1, #consumables do
			SMODS.add_card({key = consumables[i], area = G.jokers})
			G.jokers.cards[i].ability = consumable_abilities[i]
			if consumable_editions[i] == 0 then consumable_editions[i] = nil end
			G.jokers.cards[i].edition = consumable_editions[i]
		end
		G.jokers.config.card_limit, G.consumeables.config.card_limit = G.consumeables.config.card_limit, G.jokers.config.card_limit
	end
}

SMODS.Consumable {
	set = "Spectral",
	key = "balatrium",
	config = {extra = {type = "Element"}},
	atlas = "other",
	hidden = true,
	soul_set = "Element",
	pos = {x = 1, y = 0},
	soul_pos = {x = 2, y = 0},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.type,
				colours = {G.C.SECONDARY_SET[card.ability.extra.type]}
			}
		}
	end,
	can_use = function()
		return true
	end,
	use = function(self, card)
		for i=1, #G.P_CENTER_POOLS[card.abilitycard.ability.type] do
			if G.P_CENTER_POOLS[card.ability.type][i].key ~= "c_bium_balatrium" and G.P_CENTER_POOLS[card.ability.type][i].key ~= "c_cry_pointer" and G.P_CENTER_POOLS[card.ability.type][i].discovered then
				SMODS.add_card({key = G.P_CENTER_POOLS[card.ability.type][i].key, edition = "e_negative"})
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
	use = function(self, card)
		if card.ability.acidity < 10 then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
		elseif card.ability.acidity < 15 then
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
	use = function(self, card)
		if card.ability.acidity < 20 then
			for i=1, #G.consumeables.cards do
				if G.consumeables.cards[i].ability.set == "Acid" then
					G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + 2
				end
			end
		elseif card.ability.acidity < 30 then
			for i=1, #G.consumeables.cards do
				if G.consumeables.cards[i].ability.set == "Acid" then
					G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + 4
				end
			end
		else
			for i=1, #G.consumeables.cards do
				if G.consumeables.cards[i].ability.set == "Acid" then
					G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + 6
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
		if card.ability.acidity < 15 then
			ease_dollars(10)
		elseif card.ability.acidity < 30 then
			ease_dollars(20)
		else
			ease_dollars(30)
		end
	end
}

local used_up = function(self, card, badges)
	badges[#badges + 1] = create_badge(localize("k_used_up"), get_type_colour(self or card.config, card), nil, 1.2)
end

SMODS.Joker {
	key = "battery",
	config = {extra = {type = "Tarot", amount = 3, amount_mod = 1}},
	pos = {x = 3, y = 0},
	rarity = 2,
	cost = 7,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "joker",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.type, card.ability.extra.amount, card.ability.extra.amount_mod, colours = {G.C.SECONDARY_SET[card.ability.extra.type]}}}
	end,
	calculate = function(self, card, context)
		if
			(context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker)
			or context.forcetrigger
		then
			for i=1, card.ability.extra.amount do
				local card = create_card(card.ability.type, G.consumeables, nil, nil, true, true)
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
	blueprint_compat = true,
	demicoloncompat = true,
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
			(context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker)
			or context.forcetrigger
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
		if context.forcetrigger then ease_dollars(card.ability.extra.money) end
	end
}

SMODS.Joker {
	key = "proton",
	config = {extra = {mult = 2}},
	pos = {x = 1, y = 1},
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "joker",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult}}
	end,
	calculate = function(self, card, context)
		if (context.individual and context.cardarea == G.play) or context.forcetrigger then
			return {mult_mod = card.ability.extra.mult}
		end
	end
}

SMODS.Joker {
	key = "neutron",
	config = {extra = {xmult = 1.2}},
	pos = {x = 2, y = 1},
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "joker",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.xmult}}
	end,
	calculate = function(self, card, context)
		if (context.individual and context.cardarea == G.play) or context.forcetrigger then
			return {Xmult_mod = card.ability.extra.xmult}
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
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips}}
	end,
	calculate = function(self, card, context)
		if (context.individual and context.cardarea == G.play) or context.forcetrigger then
			return {message = localize({type = "variable", key = "a_chips", vars = {card.ability.extra.chips}}), chip_mod = card.ability.extra.chips}
		end
	end
}

SMODS.Joker {
	key = "systematic",
	config = {extra = {mult = 25}},
	pos = {x = 0, y = 1},
	rarity = 2,
	cost = 5,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "joker",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			local letter_count = 0
			for i=1, #G.play.cards do
				if G.play.cards[i]:get_id() > 10 then
					letter_count = letter_count + 1
				end
			end
			if letter_count == 3 or context.forcetrigger then
				return {mult_mod = card.ability.extra.mult}
			end
		end
	end
}

local acidity_increase = function(self, card, badges)
	badges[#badges + 1] = create_badge(localize("k_acidity_increase"), get_type_colour(self or card.config, card), nil, 1.2)
end

SMODS.Joker {
	key = "exuberant",
	config = {extra = {acidity = 1, type = "Pair"}},
	pos = { x = 0, y = 0 },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "acidjokers",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
				for i=1, #G.consumeables.cards do
					if G.consumeables.cards[i].ability.set == "Acid" then
						G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

SMODS.Joker {
	key = "exultant",
	config = {extra = {acidity = 1.5, type = "Three of a Kind"}},
	pos = { x = 1, y = 0 },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "acidjokers",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
				for i=1, #G.consumeables.cards do
					if G.consumeables.cards[i].ability.set == "Acid" then
						G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

SMODS.Joker {
	key = "rapturous",
	config = {extra = {acidity = 1.5, type = "Two Pair"}},
	pos = { x = 2, y = 0 },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "acidjokers",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
				for i=1, #G.consumeables.cards do
					if G.consumeables.cards[i].ability.set == "Acid" then
						G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

SMODS.Joker {
	key = "blithe",
	config = {extra = {acidity = 1.5, type = "Straight"}},
	pos = { x = 3, y = 0 },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "acidjokers",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
				for i=1, #G.consumeables.cards do
					if G.consumeables.cards[i].ability.set == "Acid" then
						G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
					end
				end
				return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
			end
		end
	end
}

SMODS.Joker {
	key = "ecstatic",
	config = {extra = {acidity = 1, type = "Flush"}},
	pos = { x = 4, y = 0 },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	demicoloncompat = true,
	atlas = "acidjokers",
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.acidity}}
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
				for i=1, #G.consumeables.cards do
					if G.consumeables.cards[i].ability.set == "Acid" then
						G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
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
	for i=1, #numbers do
		numbers_to_word_string = numbers_to_word_string .. (numbers_to_word_letters.sub(numbers_to_word_letters, numbers[i], numbers[i]) or "")
	end
	return numbers_to_word_string
end

if next(SMODS.find_mod("Cryptid")) then
	SMODS.Joker {
		key = "thrilled",
		config = {extra = {acidity = 0.5, type = "High Card"}},
		pos = { x = 0, y = 1 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end
	}

	SMODS.Joker {
		key = "enlivened",
		config = {extra = {acidity = 2, type = "Four of a Kind"}},
		pos = { x = 1, y = 1 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end
	}

	SMODS.Joker {
		key = "enthusiastic",
		config = {extra = {acidity = 2.5, type = "Straight Flush"}},
		pos = { x = 2, y = 1 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end
	}

	SMODS.Joker {
		key = "delighted",
		config = {extra = {acidity = 2, type = "Full House"}},
		pos = { x = 3, y = 1 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end
	}

	SMODS.Joker {
		key = "adrenalized",
		config = {extra = {acidity = 2.5, type = "Five of a Kind"}},
		pos = { x = 4, y = 1 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self, card)
			if G.GAME.hands["Five of a Kind"].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "astonishing",
		config = {extra = {acidity = 4.5, type = "Flush House"}},
		pos = { x = 0, y = 2 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.aciditycard.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands["Flush House"].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "staggering",
		config = {extra = {acidity = 4.5, type = "Flush Five"}},
		pos = { x = 1, y = 2 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands["Flush Five"].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "extraordinary",
		config = {extra = {acidity = 2.5, type = "cry_Bulwark"}},
		pos = { x = 2, y = 2 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands["cry_Bulwark"].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "perplexing",
		config = {extra = {acidity = 5, type = "cry_Cluster" .. numbers_to_word({6, 21, 3, 11})}},
		pos = { x = 3, y = 2 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands["cry_Cluster" .. numbers_to_word({6, 21, 3, 11})].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "spectacular",
		config = {extra = {acidity = 6, type = "cry_UltPair"}},
		pos = { x = 4, y = 2 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands["cry_UltPair"].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "nullified",
		config = {extra = {acidity = 1, type = "cry_None"}},
		pos = { x = 0, y = 3 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.acidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and context.scoring_name == card.ability.extra.type then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity + card.ability.extra.acidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands["cry_None"].played > 0 then
				return true
			end
			return false
		end
	}

	SMODS.Joker {
		key = "transcendent",
		config = {extra = {xacidity = 52, type = "cry_WholeDeck"}},
		pos = { x = 1, y = 3 },
		rarity = 1,
		cost = 4,
		blueprint_compat = true,
		demicoloncompat = true,
		atlas = "acidjokers",
		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.xacidity}}
		end,
		calculate = function(self, card, context)
			if context.joker_main or context.forcetrigger then
				if context.poker_hands ~= nil and (next(context.poker_hands[card.ability.extra.type])) then
					for i=1, #G.consumeables.cards do
						if G.consumeables.cards[i].ability.set == "Acid" then
							G.consumeables.cards[i].ability.acidity = G.consumeables.cards[i].ability.acidity * card.ability.extra.xacidity
						end
					end
					return {message = acidity_increase, colour = G.C.SECONDARY_SET.Acid}
				end
			end
		end,
		in_pool = function(self)
			if G.GAME.hands["cry_WholeDeck"].played > 0 then
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
		local card_ = create_card("Element", G.pack_cards, nil, nil, true, true)
		return card_
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
		local card = create_card("Element", G.pack_cards, nil, nil, true, true)
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
		local card = create_card("Element", G.pack_cards, nil, nil, true, true, nil)
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
		local card = create_card("Element", G.pack_cards, nil, nil, true, true, nil)
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

SMODS.Seal {
	key = "copper",
	atlas = "modifier",
	pos = {x = 0, y = 0},
	config = {extra = {type = "Element"}},
	badge_colour = HEX("EB8170"),
	loc_vars = function(self)
		return {vars = {self.config.extra.type, colours = {G.C.SECONDARY_SET[self.config.extra.type]}}}
	end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			local card = create_card(self.config.extra.type, G.consumeables, nil, nil, true, true)
			card:add_to_deck()
			G.consumeables:emplace(card)
		end
	end
}
