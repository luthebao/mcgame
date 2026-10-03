// Open-sourced by BaoLT

// Social client contract helpers.
package social

import (
	domainsocial "mcgame-server/internal/domain/social"

	pkgerrors "mcgame-server/pkg/errors"
)

func clientRelationshipTypeToDomain(clientType int) (int, error) {
	switch clientType {
	case 1:
		return domainsocial.RelationshipTypeFriend, nil
	case 2:
		return domainsocial.RelationshipTypeBlack, nil
	case 3:
		return domainsocial.RelationshipTypeEnemy, nil
	case 4:
		return domainsocial.RelationshipTypeCouple, nil
	case 5:
		return domainsocial.RelationshipTypeTutor, nil
	case 6:
		return domainsocial.RelationshipTypeBrother, nil
	default:
		return 0, pkgerrors.ErrInvalidInput
	}
}

func domainRelationshipTypeToClient(domainType int) int {
	return domainType + 1
}

func toClientRelationshipDTO(dto map[string]interface{}) map[string]interface{} {
	cloned := make(map[string]interface{}, len(dto))
	for key, value := range dto {
		cloned[key] = value
	}

	if rawType, ok := cloned["type"].(int); ok {
		cloned["type"] = domainRelationshipTypeToClient(rawType)
	}

	return cloned
}
