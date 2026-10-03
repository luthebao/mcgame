create table data.data_tbl_heiyaoshi_point (
    id          serial primary key,
    figure      smallint not null,
    point_id    smallint not null,
    price       integer  not null default 0,
    gold        integer  not null default 0,
    unique (figure, point_id)
);
create index on data.data_tbl_heiyaoshi_point (figure);

create table data.data_tbl_heiyaoshi_point_link (
    id          serial primary key,
    figure      smallint not null,
    point_id    smallint not null,
    link_type   text     not null check (link_type in ('around','area','around_line')),
    ord         smallint not null,
    neighbor_id smallint not null,
    unique (figure, point_id, link_type, ord)
);
create index on data.data_tbl_heiyaoshi_point_link (figure, point_id);

create table data.data_tbl_heiyaoshi_area (
    id          serial primary key,
    figure      smallint not null,
    area_id     smallint not null,
    l_res_num   bigint   not null default 0,
    a_res_num   bigint   not null default 0,
    unique (figure, area_id)
);
create index on data.data_tbl_heiyaoshi_area (figure);

create table data.data_tbl_heiyaoshi_area_attribute (
    id          serial primary key,
    figure      smallint not null,
    area_id     smallint not null,
    prop_id     smallint not null,
    value       double precision not null,
    unique (figure, area_id, prop_id)
);
create index on data.data_tbl_heiyaoshi_area_attribute (figure, area_id);

create table data.data_tbl_heiyaoshi_full_buff (
    id          serial primary key,
    figure      smallint not null,
    prop_id     smallint not null,
    value       double precision not null,
    unique (figure, prop_id)
);
create index on data.data_tbl_heiyaoshi_full_buff (figure);
