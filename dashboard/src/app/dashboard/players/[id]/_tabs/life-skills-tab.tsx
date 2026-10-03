"use client"

import {
    CharacterFieldForm,
    type CharacterField,
} from "../_components/character-field-form"

const FIELDS: CharacterField[] = [
    { key: "cookDex", label: "Cook Dex", dtoKey: "cookDex" },
    { key: "fishDex", label: "Fish Dex", dtoKey: "fishDex" },
    { key: "herbDex", label: "Herb Dex", dtoKey: "herbDex" },
    { key: "medicineDex", label: "Medicine Dex", dtoKey: "medicineDex" },
    { key: "plantDex", label: "Plant Dex", dtoKey: "plantDex" },
]

export function LifeSkillsTab({
    char,
    playerId,
}: {
    char: Record<string, unknown>
    playerId: number
}) {
    return (
        <CharacterFieldForm
            title="Life Skills"
            action="set_life_skills"
            char={char}
            playerId={playerId}
            fields={FIELDS}
            columns={5}
        />
    )
}
