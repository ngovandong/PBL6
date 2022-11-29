export default async function uploadImageCloudinary(file: any) {
  let imageUrl = null
  const cloudName = process.env.NEXT_PUBLIC_CLOUD_NAME
  const uploadPreset = process.env.NEXT_PUBLIC_UPLOAD_PRESET
  if (uploadPreset && cloudName) {
    const formData = new FormData()
    formData.append('file', file)
    formData.append('upload_preset', uploadPreset)
    formData.append('cloud_name', cloudName)
    try {
      const res = await fetch(
        `https://api.cloudinary.com/v1_1/${cloudName}/upload`,
        { method: 'POST', body: formData }
      )
      const data = await res.json()
      imageUrl = data.url
    } catch (error: any) {
      console.log(error)
    }
  }
  return imageUrl
}
