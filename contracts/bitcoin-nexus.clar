;; Title: Bitcoin Nexus Protocol

;; A decentralized gaming protocol built on Stacks, enabling Bitcoin-
;; secured NFT assets, player avatars, game worlds, experience systems,
;; and reward distribution mechanisms. The protocol creates an 
;; interconnected ecosystem of game assets and experiences backed by 
;; Bitcoin's security and settlement guarantees.

;; Error Constants

;; Authorization and Access Errors
(define-constant ERR-NOT-AUTHORIZED (err u1))
(define-constant ERR-INVALID-OWNER (err u21))
(define-constant ERR-INVALID-WORLD-ACCESS (err u20))

;; Asset Related Errors
(define-constant ERR-INVALID-GAME-ASSET (err u2))
(define-constant ERR-INVALID-AVATAR (err u13))
(define-constant ERR-WORLD-NOT-FOUND (err u14))

;; Validation Errors
(define-constant ERR-INVALID-NAME (err u15))
(define-constant ERR-INVALID-DESCRIPTION (err u16))
(define-constant ERR-INVALID-RARITY (err u17))
(define-constant ERR-INVALID-POWER-LEVEL (err u18))
(define-constant ERR-INVALID-ATTRIBUTES (err u19))
(define-constant ERR-INVALID-INPUT (err u8))
(define-constant ERR-INVALID-SCORE (err u9))
(define-constant ERR-INVALID-FEE (err u10))
(define-constant ERR-INVALID-ENTRIES (err u11))
(define-constant ERR-INVALID-REWARD (err u7))

;; Transaction and System Errors
(define-constant ERR-INSUFFICIENT-FUNDS (err u3))
(define-constant ERR-TRANSFER-FAILED (err u4))
(define-constant ERR-LEADERBOARD-FULL (err u5))
(define-constant ERR-ALREADY-REGISTERED (err u6))
(define-constant ERR-PLAYER-NOT-FOUND (err u12))

;; Progression System Errors
(define-constant ERR-MAX-LEVEL-REACHED (err u22))
(define-constant ERR-MAX-EXPERIENCE-REACHED (err u23))
(define-constant ERR-INVALID-LEVEL-UP (err u24))

;; Game Mechanics Constants
(define-constant MAX-LEVEL u100)
(define-constant MAX-EXPERIENCE-PER-LEVEL u1000)
(define-constant BASE-EXPERIENCE-REQUIRED u100)

;; Protocol Configuration
(define-data-var protocol-fee uint u10)
(define-data-var max-leaderboard-entries uint u50)
(define-data-var total-prize-pool uint u0)
(define-data-var total-assets uint u0)
(define-data-var total-avatars uint u0)
(define-data-var total-worlds uint u0)

;; Access Control
(define-map protocol-admin-whitelist
  principal
  bool
)

;; NFT Definitions
(define-non-fungible-token nexus-asset uint)
(define-non-fungible-token nexus-avatar uint)

;; Data Maps

;; Game Asset Metadata
(define-map nexus-asset-metadata
  { token-id: uint }
  {
    name: (string-ascii 50),
    description: (string-ascii 200),
    rarity: (string-ascii 20),
    power-level: uint,
    world-id: uint,
    attributes: (list 10 (string-ascii 20)),
    experience: uint,
    level: uint,
  }
)