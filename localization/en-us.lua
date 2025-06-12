return {
	["misc"] = {
		["dictionary"] = {
			["b_acid_cards"] = "Acid Cards",
			["b_element_cards"] = "Element Cards",
			["k_bium_atomic_pack"] = "Atomic Pack",
			["k_acid"] = "Acid",
			["k_element"] = "Element",
			["k_isotope"] = "Isotope",
			["k_used_up"] = "Used up!"
		}
	},
	["descriptions"] = {
		["Joker"] = {
			["j_bium_battery"] = {
				["name"] = "Battery",
				["text"] = {"Create {C:attention}#2#{} {V:1}#1#{} cards", "Decreases by {C:attention}#3#{} at the end of round"}
			},
			["j_bium_salt_cube"] = {
				["name"] = "Salt Cube",
				["text"] = {"{C:money}+$#1#{} at the end of round", "Loses {C:red}-$#2#{} at the end of round"}
			},
			["j_bium_proton"] = {
				["name"] = "Proton",
				["text"] = {"Each scored card", "gives {C:mult}+#1#{} Mult"}
			},
			["j_bium_neutron"] = {
				["name"] = "Neutron",
				["text"] = {"Each scored card", "gives {X:mult,C:white}X#1#{} Mult"}
			},
			["j_bium_electron"] = {
				["name"] = "Electron",
				["text"] = {"Each scored card", "gives {C:chips}+#1#{} Chips"}
			},
			["j_bium_systematic"] = {
				["name"] = "Systematic Element Name",
				["text"] = {"{C:mult}+#1#{} Mult if played", "hand contains exactly", "{C:attention}3{} scoring face cards"}
			},
			["j_bium_exuberant"] = {
				["name"] = "Exuberant Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Pair"}
			},
			["j_bium_exultant"] = {
				["name"] = "Exultant Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Three of a Kind"}
			},
			["j_bium_rapturous"] = {
				["name"] = "Rapturous Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Two Pair"}
			},
			["j_bium_blithe"] = {
				["name"] = "Blithe Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Straight"}
			},
			["j_bium_ecstatic"] = {
				["name"] = "Ecstatic Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Flush"}
			},
			["j_bium_thrilled"] = {
				["name"] = "Thrilled Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}High Card"}
			},
			["j_bium_enlivened"] = {
				["name"] = "Enlivened Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Four of a Kind"}
			},
			["j_bium_enthusiastic"] = {
				["name"] = "Enthusiastic Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Straight Flush"}
			},
			["j_bium_delighted"] = {
				["name"] = "Delighted Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Full House"}
			},
			["j_bium_adrenalized"] = {
				["name"] = "Adrenalized Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Five of a Kind"}
			},
			["j_bium_astonishing"] = {
				["name"] = "Astonishing Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Flush House"}
			},
			["j_bium_staggering"] = {
				["name"] = "Staggering Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Flush Five"}
			},
			["j_bium_extraordinary"] = {
				["name"] = "Extraordinary Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Bulwark"}
			},
			["j_bium_perplexing"] = {
				["name"] = "Perplexing Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "a {C:attention}Cluster"}
			},
			["j_bium_spectacular"] = {
				["name"] = "Spectacular Joker",
				["text"] = {"Increase the {C:acid}Acidity{} of all {C:acid}Acids{}", "by {C:attention}#1#{} if played hand contains", "an {C:attention}Ultimate Pair"}
			}
		},
		["Spectral"] = {
			["c_bium_balatrium"] = {
				["name"] = "Balatrium",
				["text"] = {"Creates a {C:dark_edition}Negative{} copy", "of every discovered {V:1}#1#{}"}
			}
		},
		["Element"] = {
			["c_bium_hydrogen"] = {
				["name"] = "Hydrogen",
				["text"] = {"Converts all selected", "cards to {V:1}#2#{}"}
			},
			["c_bium_deuterium"] = {
				["name"] = "Deuterium",
				["text"] = {"Converts all selected", "cards to {V:1}#2#{}"}
			},
			["c_bium_tritium"] = {
				["name"] = "Tritium",
				["text"] = {"Converts all selected", "cards to {V:1}#2#{}"}
			},
			["c_bium_helium"] = {
				["name"] = "Helium",
				["text"] = {"Adds {C:dark_edition}Foil{} to", "{C:attention}#1#{} selected cards"}
			},
			["c_bium_lithium"] = {
				["name"] = "Lithium",
				["text"] = {"Creates a {C:attention}Battery{}"}
			},
			["c_bium_beryllium"] = {
				["name"] = "Beryllium",
				["text"] = {"{C:money}+$#1#{}"}
			},
			["c_bium_boron"] = {
				["name"] = "Boron",
				["text"] = {"{C:attention}-#1# Ante{}"}
			},
			["c_bium_carbon"] = {
				["name"] = "Carbon",
				["text"] = {"Converts all selected", "cards to {V:1}#2#{}"}
			},
			["c_bium_nitrogen"] = {
				["name"] = "Nitrogen",
				["text"] = {"Converts all selected", "cards to {V:1}#2#{}"}
			},
			["c_bium_oxygen"] = {
				["name"] = "Oxygen",
				["text"] = {"Converts all selected", "cards to {V:1}#2#{}"}
			},
			["c_bium_fluorine"] = {
				["name"] = "Fluorine",
				["text"] = {"Creates an {V:1}#1#{}", "with 0 {C:acid}Acidity{}"}
			},
			["c_bium_neon"] = {
				["name"] = "Neon",
				["text"] = {"Adds {C:dark_edition}Holographic{} to", "{C:attention}#1#{} selected cards"}
			},
			["c_bium_sodium"] = {
				["name"] = "Sodium",
				["text"] = {"Creates a {C:attention}Salt Cube{}"}
			},
			["c_bium_magnesium"] = {
				["name"] = "Magnesium",
				["text"] = {"Multiply {C:money}money{} by {X:money,C:white}X#1#{}"}
			},
			["c_bium_aluminum"] = {
				["name"] = "Aluminum",
				["text"] = {"{C:attention}-#1# Ante{}, {C:attention}+#2#{C:red} Discard"}
			},
			["c_bium_silicon"] = {
				["name"] = "Silicon",
				["text"] = {"Creates {C:attention}#1#{} random", "{V:1}#2#{} cards"}
			},
			["c_bium_phosphorus"] = {
				["name"] = "Phosphorus",
				["text"] = {"Creates {C:attention}#1#{} random", "{V:1}#2#s{}"}
			},
			["c_bium_sulfur"] = {
				["name"] = "Sulfur",
				["text"] = {"Redeems a random {C:attention}Voucher{}"}
			},
			["c_bium_chlorine"] = {
				["name"] = "Chlorine",
				["text"] = {"Increases the {C:acid}Acidity{} of", "all {C:acid}Acids{} by {C:attention}#1#{}"}
			},
			["c_bium_argon"] = {
				["name"] = "Argon",
				["text"] = {"Adds {C:dark_edition}Polychrome{} to", "{C:attention}#1#{} selected cards"}
			},
			["c_bium_potassium"] = {
				["name"] = "Potassium",
				["text"] = {"Creates a {C:attention}Gros Michel{}"}
			},
			["c_bium_calcium"] = {
				["name"] = "Calcium",
				["text"] = {"{C:money}+$#1#{}, then multiply", "{C:money}money{} by {X:money,C:white}X#2#{}"}
			}
		},
		["Acid"] = {
			["c_bium_hf"] = {
				["name"] = "Hydrofluoric Acid",
				["text"] = {"Gives {C:blue}Hands{} and {C:red}Discards{}", "based on the current {C:acid}Acidity{}", "{C:acid}<5{}: {C:blue}0{}/{C:red}0{}", "{C:acid}5-9{}: {C:blue}0{}/{C:red}1{}", "{C:acid}10-14{}: {C:blue}1{}/{C:red}1{}", "{C:acid}>14{}: {C:blue}2{}/{C:red}2{}", "{C:inactive}(Currently {C:acid}#1# Acidity{C:inactive}){}"}
			},
			["c_bium_hcl"] = {
				["name"] = "Hydrochloric Acid",
				["text"] = {"Increases {C:acid}Acidity{} of all other", "{C:acid}Acids{} based on the current {C:acid}Acidity{}", "{C:acid}<10{}: {C:acid}+0{}", "{C:acid}10-19{}: {C:acid}+2{}", "{C:acid}20-29{}: {C:acid}+4{}", "{C:acid}>29{}: {C:acid}+6{}", "{C:inactive}(Currently {C:acid}#1# Acidity{C:inactive}){}"}
			},
			["c_bium_hbr"] = {
				["name"] = "Hydrobromic Acid",
				["text"] = {"Gives {C:money}money{} base on", "the current {C:acid}Acidity{}", "{C:acid}<5{}: {C:money}+$0{}", "{C:acid}5-14{}: {C:money}+$10{}", "{C:acid}15-29{}: {C:money}+$20{}", "{C:acid}>29{}: {C:money}+$30{}", "{C:inactive}(Currently {C:acid}#1# Acidity{C:inactive}){}"}
			}
		},
		["Other"] = {
			["undiscovered_element"] = {
				["name"] = "Not Discovered",
				["text"] = {"Purchase or use", "this card in an", "unseeded run to", "learn what it does"},
			},
			["undiscovered_acid"] = {
				["name"] = "Not Discovered",
				["text"] = {"Purchase or use", "this card in an", "unseeded run to", "learn what it does"},
			},
			["p_bium_atomic_normal_1"] = {
				["name"] = "Atomic Pack",
				["text"] = {"Choose {C:attention}#1#{} of up to", "{C:attention}#2#{C:element} Element{} cards"}
			},
			["p_bium_atomic_normal_2"] = {
				["name"] = "Atomic Pack",
				["text"] = {"Choose {C:attention}#1#{} of up to", "{C:attention}#2#{C:element} Element{} cards"}
			},
			["p_bium_atomic_jumbo_1"] = {
				["name"] = "Jumbo Atomic Pack",
				["text"] = {"Choose {C:attention}#1#{} of up to", "{C:attention}#2#{C:element} Element{} cards"}
			},
			["p_bium_atomic_mega_1"] = {
				["name"] = "Mega Atomic Pack",
				["text"] = {"Choose {C:attention}#1#{} of up to", "{C:attention}#2#{C:element} Element{} cards"}
			}
		}
	}
}
