# ALWISI Gallery Integration Plan
**Date:** 2026-03-24  
**Approach:** Option 3 - Hybrid (Homepage carousel + future dedicated pages)

---

## Selected Featured Photos (Top 9)

### Bodenbelag Verlegen (4 photos)
1. **c2.jpeg** - Decking detail with shadow (most visually striking)
2. **c1.jpeg** - Complete balcony decking (finished work showcase)
3. **a1.jpeg** - Interlocking pavers (in-progress, shows process)
4. **b2.jpeg** - Before/after candidate

### Haus Isolierung (2 photos)
5. **a1.jpeg** - Foundation damage (dramatic before)
6. **a2.jpeg** - Waterproofing membrane (clear transformation)

### Professionelle Gartenarbeit (2 photos)
7. **a2.jpeg** - Prepared garden bed (clean after shot)
8. **b1.jpeg** - Pool edge work (scope demonstration)

### Professionelle Malerarbeiten (1 photo)
9. **a1.jpeg** - Weathered shed (before shot, needs pairing)

---

## Phase 1: Optimization

**Target specs:**
- Full-size: 1920px max width, 85% quality, ~150-200KB
- Thumbnail: 600x600px, 80% quality, ~80KB
- Strip EXIF metadata
- Convert .jpeg → .jpg

**Manual optimization for 9 featured photos:**
```bash
cd /home/node/.openclaw/workspace/shared/alwisi/pictures
mkdir -p gallery-featured

# Bodenbelag
convert "Bodenbelag Verlegen/c2.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/bodenbelag-1.jpg
convert "Bodenbelag Verlegen/c1.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/bodenbelag-2.jpg
convert "Bodenbelag Verlegen/a1.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/bodenbelag-3.jpg
convert "Bodenbelag Verlegen/b2.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/bodenbelag-4.jpg

# Haus Isolierung
convert "Haus Isolierung/a1.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/isolierung-1.jpg
convert "Haus Isolierung/a2.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/isolierung-2.jpg

# Gartenarbeit
convert "Professionelle Gartenarbeit/a2.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/garten-1.jpg
convert "Professionelle Gartenarbeit/b1.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/garten-2.jpg

# Malerarbeiten
convert "Professionelle Malerarbeiten/a1.jpeg" -resize '1920x1920>' -quality 85 -strip gallery-featured/maler-1.jpg
```

---

## Phase 2: Homepage Integration

**Add new section after Services, before Why Us:**

```html
<!-- GALLERY PREVIEW -->
<section class="gallery-preview" id="galerie">
    <div class="container">
        <div class="section-header fade-in">
            <div class="section-label">
                <span data-lang-de>Unsere Arbeiten</span>
                <span data-lang-ar>أعمالنا</span>
            </div>
            <h2>
                <span data-lang-de>Projekte in Bildern</span>
                <span data-lang-ar>مشاريع بالصور</span>
            </h2>
            <p>
                <span data-lang-de>Überzeugen Sie sich selbst — echte Projekte aus Neuss und Düsseldorf.</span>
                <span data-lang-ar>اقتنع بنفسك — مشاريع حقيقية من نويس ودوسلدورف.</span>
            </p>
        </div>
        
        <div class="gallery-grid fade-in">
            <!-- 9 featured photos in 3x3 grid -->
        </div>
        
        <div style="text-align:center; margin-top:32px;">
            <p style="color:var(--gray-600); font-size:1.05rem; font-weight:500;">
                <span data-lang-de>Vollständige Galerie folgt in Kürze</span>
                <span data-lang-ar">المعرض الكامل قريباً</span>
            </p>
        </div>
    </div>
</section>
```

**CSS additions:**
```css
.gallery-preview {
    background: var(--white);
}

.gallery-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 16px;
}

.gallery-item {
    position: relative;
    overflow: hidden;
    border-radius: var(--radius);
    cursor: pointer;
    aspect-ratio: 1;
}

.gallery-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.4s ease;
}

.gallery-item:hover img {
    transform: scale(1.05);
}

.gallery-item .overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
    padding: 20px 16px 16px;
    color: white;
    transform: translateY(100%);
    transition: transform 0.3s;
}

.gallery-item:hover .overlay {
    transform: translateY(0);
}
```

---

## Phase 3: Future Structure

**Placeholder directory:**
```
/galerie/
  ├── index.html (main gallery hub - coming soon page)
  ├── bodenbelag.html
  ├── malerarbeiten.html
  ├── gartenarbeit.html
  ├── isolierung.html
  ├── renovierung.html (placeholder - needs photos)
  ├── tapezieren.html (placeholder - needs photos)
  ├── umzug.html (placeholder - needs photos)
  └── entruempelung.html (placeholder - needs photos)
```

---

## Phase 4: SEO & Alt Text

**Alt text pattern:**
```
"{Service} {Stage} — ALWISI Dienstleistungen {Location}"

Examples:
- "Bodenbelag Verlegung Detail — ALWISI Dienstleistungen Neuss"
- "Haus Isolierung Vorher — ALWISI Wasserschaden Reparatur Düsseldorf"
- "Gartenarbeit Ergebnis — ALWISI Landschaftsgestaltung Neuss"
```

---

## Next Steps

1. ✅ Create optimization plan
2. ⏳ Optimize 9 featured photos
3. ⏳ Add gallery section to index.html
4. ⏳ Test on mobile/desktop
5. ⏳ Push to GitHub
6. ⏳ Verify live deployment

---

## Future Enhancements (Phase 2+)

- [ ] Full optimization script for all 58 photos
- [ ] Dedicated gallery pages per service
- [ ] Before/after slider component
- [ ] Lightbox integration (GLightbox)
- [ ] Customer testimonials with photos
- [ ] Monthly project addition workflow
- [ ] Google Business post integration
