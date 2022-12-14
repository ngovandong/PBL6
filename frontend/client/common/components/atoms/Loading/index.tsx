import styles from './styles.module.scss'

export const CircleLoading = () => {
  return (
    <div className={styles['wrapper']}>
      <div className={styles['circle']}></div>
      <div className={styles['circle']}></div>
      <div className={styles['circle']}></div>
      <div className={styles['shadow']}></div>
      <div className={styles['shadow']}></div>
      <div className={styles['shadow']}></div>
      <span>Đang tải</span>
    </div>
  )
}
