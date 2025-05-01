'use client'
import React from 'react'

import { cn } from "./../../../../lib/utils"
import { Button } from '../ui/button'

// Biến chứa các kiểu button mở rộng
const customButtonVariants = {
  variants: {
    variant: {
      default: 'bg-[#DA1E37] text-white hover:bg-[#c01b31] font-medium cursor-pointer px-20',
      outline: 'border border-[#DA1E37] bg-transparent text-[#DA1E37] hover:bg-[#DA1E37] hover:text-white'
    },
    rounded: {
      default: 'rounded-md',
      sm: 'rounded-sm',
      lg: 'rounded-lg',
      xl: 'rounded-xl',
      '2xl': 'rounded-2xl',
      full: 'rounded-full'
    }
  }
}

// Interface định nghĩa props cho CustomButton
export interface CustomButtonProps extends React.ComponentPropsWithoutRef<typeof Button> {
  fullWidth?: boolean
  rounded?: 'default' | 'sm' | 'lg' | 'xl' | '2xl' | 'full'
}

/**
 * Function: Hiển thị nút bấm tùy chỉnh dựa trên thành phần Button gốc
 *
 * @param className - Các class CSS tùy chỉnh từ bên ngoài
 * @param variant - Kiểu hiển thị của nút: default | outline
 * @param size - Kích thước của nút
 * @param rounded - Kiểu bo góc: sm, lg, xl, 2xl, full (mặc định: 'default')
 * @param fullWidth - Có chiếm toàn bộ chiều ngang hay không
 * @param children - Nội dung bên trong nút
 * @param props - Các props khác kế thừa từ Button
 *
 * @returns JSX element hiển thị nút bấm đã được style theo yêu cầu
 */
const CustomButton = React.forwardRef<HTMLButtonElement, CustomButtonProps>(
  ({ className, variant, size, rounded = 'default', fullWidth, children, ...props }, ref) => {
    // Xác định class CSS cho bo góc
    const roundedClass =
      rounded === 'sm'
        ? 'rounded-sm'
        : rounded === 'lg'
          ? 'rounded-lg'
          : rounded === 'xl'
            ? 'rounded-xl'
            : rounded === '2xl'
              ? 'rounded-2xl'
              : rounded === 'full'
                ? 'rounded-full'
                : 'rounded-md'

    // Xác định class CSS cho kiểu nút (override nếu có)
    const variantClass =
      variant === 'default'
        ? 'bg-[#DA1E37] text-white hover:bg-[#c01b31] font-medium cursor-pointer px-10'
        : variant === 'outline'
          ? 'border border-[#DA1E37] bg-transparent text-[#DA1E37] hover:bg-[#DA1E37] hover:text-white px-10'
          : ''

    return (
      <Button
        className={cn(roundedClass, variantClass, fullWidth && 'w-full', className)}
        variant={variant}
        size={size}
        ref={ref}
        {...props}
      >
        {children}
      </Button>
    )
  }
)

CustomButton.displayName = 'CustomButton'

export { CustomButton, customButtonVariants }
