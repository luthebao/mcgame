"use client"

import {
    CharacterFieldForm,
    type CharacterField,
} from "../_components/character-field-form"

const BASE_FIELDS: CharacterField[] = [
    { key: "strength", label: "Strength (STR)", dtoKey: "attStrength" },
    { key: "agility", label: "Agility (AGI)", dtoKey: "attAgility" },
    { key: "stamina", label: "Stamina (STA)", dtoKey: "attStamina" },
    {
        key: "intelligence",
        label: "Intelligence (INT)",
        dtoKey: "attIntelligence",
    },
    { key: "spirit", label: "Spirit (Energy)", dtoKey: "attEnergy" },
    { key: "attrPoints", label: "Attribute Points", dtoKey: "attLastPoint" },
    { key: "hp", label: "Current HP", dtoKey: "currentHp" },
    { key: "mp", label: "Current MP", dtoKey: "currentMp" },
    { key: "sp", label: "Current SP", dtoKey: "currentSp" },
]

const APTITUDE_FIELDS: CharacterField[] = [
    { key: "aptStrength", label: "Apt Strength", dtoKey: "aptStrength" },
    {
        key: "aptStrengthEvolution",
        label: "Apt Strength Evo",
        dtoKey: "aptStrengthEvolution",
    },
    { key: "aptAgility", label: "Apt Agility", dtoKey: "aptAgility" },
    {
        key: "aptAgilityEvolution",
        label: "Apt Agility Evo",
        dtoKey: "aptAgilityEvolution",
    },
    { key: "aptStamina", label: "Apt Stamina", dtoKey: "aptStamina" },
    {
        key: "aptStaminaEvolution",
        label: "Apt Stamina Evo",
        dtoKey: "aptStaminaEvolution",
    },
    {
        key: "aptIntelligence",
        label: "Apt Intelligence",
        dtoKey: "aptIntelligence",
    },
    {
        key: "aptIntelligenceEvolution",
        label: "Apt Intelligence Evo",
        dtoKey: "aptIntelligenceEvolution",
    },
    { key: "aptEnergy", label: "Apt Energy", dtoKey: "aptEnergy" },
    {
        key: "aptEnergyEvolution",
        label: "Apt Energy Evo",
        dtoKey: "aptEnergyEvolution",
    },
]

export function AttributesTab({
    char,
    playerId,
}: {
    char: Record<string, unknown>
    playerId: number
}) {
    return (
        <div className="space-y-6">
            <CharacterFieldForm
                title="Attributes"
                action="set_attributes"
                char={char}
                playerId={playerId}
                fields={BASE_FIELDS}
                columns={5}
                note="Stats are recalculated automatically after save."
            />
            <CharacterFieldForm
                title="Aptitudes"
                action="set_attributes"
                char={char}
                playerId={playerId}
                fields={APTITUDE_FIELDS}
                columns={5}
            />
        </div>
    )
}
