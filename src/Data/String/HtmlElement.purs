module Data.String.HtmlElements
  ( encode
  , encode'
  , decode
  , decode'
  , EncodeOptions
  , DecodeOptions
  , defaultEncodeOptions
  , defaultDecodeOptions
  ) where

foreign import encodeWith :: EncodeOptions -> String -> String

encode' :: EncodeOptions -> String -> String
encode' = encodeWith

foreign import decodeWith :: DecodeOptions -> String -> String

decode' :: DecodeOptions -> String -> String
decode' = decodeWith

type EncodeOptions =
  { useNamedReferences :: Boolean
  , decimal :: Boolean
  , encodeEverything :: Boolean
  , strict :: Boolean
  , allowUnsafeSymbols :: Boolean
  }

type DecodeOptions =
  { isAttributeValue :: Boolean
  , strict :: Boolean
  }

defaultEncodeOptions :: EncodeOptions
defaultEncodeOptions =
  { useNamedReferences: false
  , decimal: false
  , encodeEverything: false
  , strict: false
  , allowUnsafeSymbols: false
  }

defaultDecodeOptions :: DecodeOptions
defaultDecodeOptions =
  { isAttributeValue: false
  , strict: false
  }

encode :: String -> String
encode = encode' defaultEncodeOptions

decode :: String -> String
decode = decode' defaultDecodeOptions
