
CREATE TABLE address (
    id_address   INTEGER NOT NULL,
    street       VARCHAR2(255 BYTE) NOT NULL,
    apartment    VARCHAR2(255 BYTE) NOT NULL,
    city         VARCHAR2(255 BYTE) NOT NULL,
    state        VARCHAR2(255 BYTE) NOT NULL,
    zip          VARCHAR2(255 BYTE) NOT NULL,
    country      VARCHAR2(255 BYTE) NOT NULL,
    created      DATE NOT NULL,
    user_id      INTEGER NOT NULL
);

ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY ( id_address );

CREATE TABLE banking_info (
    id_banking_info            INTEGER NOT NULL,
    user_id                    INTEGER NOT NULL,
    name                       VARCHAR2(255 BYTE) NOT NULL,
    transit_no                 INTEGER NOT NULL,
    bank_no                    INTEGER NOT NULL,
    account_no                 INTEGER NOT NULL,
    order_id_order             INTEGER NOT NULL,
    order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE banking_info
    ADD CONSTRAINT banking_info_pk PRIMARY KEY ( id_banking_info,
                                                 order_id_order,
                                                 order_address_id_address );

CREATE TABLE chat (
    id_chat                    INTEGER NOT NULL,
    sender_id                  INTEGER NOT NULL,
    receiver_id                INTEGER NOT NULL,
    message                    CLOB NOT NULL,
    conversation_id            INTEGER NOT NULL,
    created                    DATE NOT NULL,
    read                       INTEGER NOT NULL,
    order_id_order             INTEGER NOT NULL,
    order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE chat
    ADD CONSTRAINT chat_pk PRIMARY KEY ( id_chat,
                                         order_id_order,
                                         order_address_id_address );

CREATE TABLE coupon_used (
    id_coupon_used             INTEGER NOT NULL,
    oreder_id                  INTEGER NOT NULL,
    coupon_id                  INTEGER NOT NULL,
    created                    DATE NOT NULL,
    order_id_order             INTEGER NOT NULL,
    order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE coupon_used
    ADD CONSTRAINT coupon_used_pk PRIMARY KEY ( id_coupon_used,
                                                order_id_order,
                                                order_address_id_address );

CREATE TABLE currency (
    id_currency                INTEGER NOT NULL,
    country                    VARCHAR2(255 BYTE) NOT NULL,
    currency                   VARCHAR2(255 BYTE) NOT NULL,
    order_id_order             INTEGER NOT NULL,
    order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE currency
    ADD CONSTRAINT currency_pk PRIMARY KEY ( id_currency,
                                             order_id_order,
                                             order_address_id_address );

CREATE TABLE open_shift (
    id_open_shift              INTEGER NOT NULL,
    "date"                     DATE NOT NULL,
    starting_time              DATE NOT NULL,
    ending_time                DATE NOT NULL,
    rider_user_id              INTEGER NOT NULL,
    shift                      INTEGER NOT NULL,
    created                    DATE NOT NULL,
    order_id_order             INTEGER NOT NULL,
    order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE open_shift
    ADD CONSTRAINT open_shift_pk PRIMARY KEY ( id_open_shift,
                                               order_id_order,
                                               order_address_id_address );

CREATE TABLE "order" (
    id_order                  INTEGER NOT NULL,
    deal_id                   INTEGER NOT NULL,
    created                   DATE NOT NULL,
    price                     FLOAT(10) NOT NULL,
    status                    INTEGER NOT NULL,
    delivery_fee              FLOAT(10) NOT NULL,
    user_id                   INTEGER NOT NULL,
    address_id                INTEGER NOT NULL,
    payment_method_id         INTEGER NOT NULL,
    quantity                  INTEGER NOT NULL,
    delivery                  INTEGER NOT NULL,
    rider_tip                 INTEGER NOT NULL,
    tax                       FLOAT(10) NOT NULL,
    sub_total                 FLOAT(10) NOT NULL,
    restaurant_id             INTEGER NOT NULL,
    instruction               CLOB NOT NULL,
    accepted_reason           CLOB NOT NULL,
    cod                       INTEGER NOT NULL,
    notification              INTEGER NOT NULL,
    rejected_reason           CLOB NOT NULL,
    restaurant_delivery_fee   INTEGER NOT NULL,
    delivery_fee_per_km       INTEGER NOT NULL,
    delivery_free_range       INTEGER NOT NULL,
    stripe_charge             VARCHAR2(255 BYTE) NOT NULL,
    address_id_address        INTEGER NOT NULL
);

ALTER TABLE "order" ADD CONSTRAINT order_pk PRIMARY KEY ( id_order,
                                                          address_id_address );

CREATE TABLE order_deal (
    id_order_deal                              INTEGER NOT NULL,
    restaurant_id                              INTEGER NOT NULL,
    name                                       VARCHAR2(255 BYTE) NOT NULL,
    description                                CLOB NOT NULL,
    instructions                               CLOB NOT NULL,
    price                                      FLOAT(10) NOT NULL,
    delivery_fee                               INTEGER NOT NULL,
    rider_tip                                  INTEGER NOT NULL,
    payment_method_id                          INTEGER NOT NULL,
    cod                                        INTEGER NOT NULL,
    status                                     INTEGER NOT NULL,
    delivery                                   INTEGER NOT NULL,
    quantity                                   FLOAT(10) NOT NULL,
    tax                                        FLOAT(10) NOT NULL,
    sub_total                                  FLOAT(10) NOT NULL,
    address_id                                 INTEGER NOT NULL,
    user_id                                    INTEGER NOT NULL,
    created                                    DATE NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    order_menu_item_id_order_menu_item         INTEGER NOT NULL,
    order_menu_item_order_id_order             INTEGER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    order_menu_item_order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE order_deal
    ADD CONSTRAINT order_deal_pk PRIMARY KEY ( id_order_deal,
                                               order_menu_item_id_order_menu_item,
                                               order_menu_item_order_id_order,
                                               order_menu_item_order_address_id_address );

CREATE TABLE order_menu_extra_item (
    id_order_menu_extra_item                   INTEGER NOT NULL,
    order_menu_item_id                         INTEGER NOT NULL,
    name                                       VARCHAR2(255 BYTE) NOT NULL,
    quantity                                   INTEGER NOT NULL,
    price                                      FLOAT(10) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    order_menu_item_id_order_menu_item         INTEGER NOT NULL,
    order_menu_item_order_id_order             INTEGER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    order_menu_item_order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE order_menu_extra_item
    ADD CONSTRAINT order_menu_extra_item_pk PRIMARY KEY ( id_order_menu_extra_item,
                                                          order_menu_item_id_order_menu_item,
                                                          order_menu_item_order_id_order,
                                                          order_menu_item_order_address_id_address );

CREATE TABLE order_menu_item (
    id_order_menu_item         INTEGER NOT NULL,
    order_id                   INTEGER NOT NULL,
    name                       VARCHAR2(255 BYTE) NOT NULL,
    quantity                   INTEGER NOT NULL,
    price                      VARCHAR2(255 BYTE) NOT NULL,
    deal_description           INTEGER NOT NULL,
    order_id_order             INTEGER NOT NULL,
    order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE order_menu_item
    ADD CONSTRAINT order_menu_item_pk PRIMARY KEY ( id_order_menu_item,
                                                    order_id_order,
                                                    order_address_id_address );

CREATE TABLE payment_method (
    id_payment_method          VARCHAR2(255 BYTE) NOT NULL,
    stripe                     VARCHAR2(255 BYTE) NOT NULL,
    paypal                     VARCHAR2(255 BYTE) NOT NULL,
    created                    DATE NOT NULL,
    user_id                    INTEGER NOT NULL,
    order_id_order             INTEGER NOT NULL,
    order_address_id_address   INTEGER NOT NULL
);

ALTER TABLE payment_method
    ADD CONSTRAINT payment_method_pk PRIMARY KEY ( id_payment_method,
                                                   order_id_order,
                                                   order_address_id_address );

ALTER TABLE banking_info
    ADD CONSTRAINT banking_info_order_fk FOREIGN KEY ( order_id_order,
                                                       order_address_id_address )
        REFERENCES "order" ( id_order,
                             address_id_address );

ALTER TABLE chat
    ADD CONSTRAINT chat_order_fk FOREIGN KEY ( order_id_order,
                                               order_address_id_address )
        REFERENCES "order" ( id_order,
                             address_id_address );

ALTER TABLE coupon_used
    ADD CONSTRAINT coupon_used_order_fk FOREIGN KEY ( order_id_order,
                                                      order_address_id_address )
        REFERENCES "order" ( id_order,
                             address_id_address );

ALTER TABLE currency
    ADD CONSTRAINT currency_order_fk FOREIGN KEY ( order_id_order,
                                                   order_address_id_address )
        REFERENCES "order" ( id_order,
                             address_id_address );

ALTER TABLE open_shift
    ADD CONSTRAINT open_shift_order_fk FOREIGN KEY ( order_id_order,
                                                     order_address_id_address )
        REFERENCES "order" ( id_order,
                             address_id_address );

ALTER TABLE "order"
    ADD CONSTRAINT order_address_fk FOREIGN KEY ( address_id_address )
        REFERENCES address ( id_address );

ALTER TABLE order_deal
    ADD CONSTRAINT order_deal_order_menu_item_fk FOREIGN KEY ( order_menu_item_id_order_menu_item,
                                                               order_menu_item_order_id_order,
                                                               order_menu_item_order_address_id_address )
        REFERENCES order_menu_item ( id_order_menu_item,
                                     order_id_order,
                                     order_address_id_address );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE order_menu_extra_item
    ADD CONSTRAINT order_menu_extra_item_order_menu_item_fk FOREIGN KEY ( order_menu_item_id_order_menu_item,
                                                                          order_menu_item_order_id_order,
                                                                          order_menu_item_order_address_id_address )
        REFERENCES order_menu_item ( id_order_menu_item,
                                     order_id_order,
                                     order_address_id_address );

ALTER TABLE order_menu_item
    ADD CONSTRAINT order_menu_item_order_fk FOREIGN KEY ( order_id_order,
                                                          order_address_id_address )
        REFERENCES "order" ( id_order,
                             address_id_address );

ALTER TABLE payment_method
    ADD CONSTRAINT payment_method_order_fk FOREIGN KEY ( order_id_order,
                                                         order_address_id_address )
        REFERENCES "order" ( id_order,
                             address_id_address );



