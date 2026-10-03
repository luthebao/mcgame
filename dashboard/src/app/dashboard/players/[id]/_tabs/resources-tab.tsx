"use client"

import {
    CharacterFieldForm,
    type CharacterField,
} from "../_components/character-field-form"

const FIELDS: CharacterField[] = [
    { key: "bagSlotNum", label: "Bag Count", dtoKey: "bagSlotNum" },
    { key: "bankSlotNum", label: "Bank Count", dtoKey: "bankSlotNum" },
    { key: "petSlots", label: "Pet Slots", dtoKey: "petSlots" },
    { key: "tempBagSlots", label: "Temp Bag Slots", dtoKey: "tempBagSlots" },
    {
        key: "mxTempBagSlots",
        label: "Max Temp Bag Slots",
        dtoKey: "mxTempBagSlots",
    },
]

export function ResourcesTab({
    char,
    playerId,
}: {
    char: Record<string, unknown>
    playerId: number
}) {
    const bagSlots = Number(char.bagSlots ?? char.bagSlotsBase ?? 0)
    const bankSlots = Number(char.bankSlots ?? char.bankSlotsBase ?? 0)

    return (
        <CharacterFieldForm
            title="Resources"
            action="set_resources"
            char={char}
            playerId={playerId}
            fields={FIELDS}
            columns={5}
            description="Bag Count covers regular bag pages 1-7. Bank Count covers bank pages 1-5. Empty fields are ignored."
            note={`Each bag or bank count equals 30 slots. Bag pages 8 and 9 stay as the default quest and pet pages. Current totals: bag ${bagSlots}, bank ${bankSlots}.`}
        />
    )
}
