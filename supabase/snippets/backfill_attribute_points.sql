UPDATE player.character_attributes a
   SET max_attr_points = (p.level - 1) * 5,
       attr_points     = ((p.level - 1) * 5) - a.distributed_attr_points + a.attr_points
  FROM player.character_progression p
 WHERE p.character_id = a.character_id
   AND p.level > 1
   AND a.max_attr_points < (p.level - 1) * 5;
