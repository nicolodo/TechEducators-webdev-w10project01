
import { auth } from '@clerk/nextjs/server'
import { DispatcherEvent } from 'next/dist/next-devtools/dev-overlay/shared'

export default function AddToCart() {
    async function addItem(formData: FormData) {
        'use server'

        const { isAuthenticated } = await auth()

        if (!isAuthenticated) {
            throw new Error(
                'You must be signed in to add an item to your cart'
            )
        }
        
        console.log('add item server action', formData)
        }

}


