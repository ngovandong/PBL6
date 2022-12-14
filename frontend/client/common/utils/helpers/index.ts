import { isArray } from 'lodash'

export const validateEmail = (value: string) => {
  return value
    .trim()
    .toLowerCase()
    .match(
      /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/
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

export const reloadSession = () => {
  const event = new Event('visibilitychange')
  document.dispatchEvent(event)
}

export const trimDataObject = (data: { [key: string]: any }) => {
  Object.keys(data).forEach((item) => {
    if (typeof data[item] === 'string') {
      data[item] = data[item].trim()
    }
  })
  return data
}
