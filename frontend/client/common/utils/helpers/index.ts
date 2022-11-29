import { isArray } from 'lodash'

export const validateEmail = (value: string) => {
  return value
    .trim()
    .toLowerCase()
    .match(
      /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    )
}

export const validatePassword = (value: string) => {
  return /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/g.test(value)
}

export const renderDefaultValuesForHook = (
  defaultObj: {
    [item: string]: any
  },
  arrLabel?: string[]
) => {
  const result: { [item: string]: any } = {}
  if (isArray(arrLabel) && arrLabel?.length > 0) {
    Object.keys(defaultObj).map((item: string) => {
      if (!arrLabel.includes(item)) delete defaultObj[item]
    })
  }
  if (typeof defaultObj === 'object') {
    Object.keys(defaultObj).forEach((item: string) => {
      result[item] = defaultObj[item]
    })
  }
  return result
}
